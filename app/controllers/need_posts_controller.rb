class NeedPostsController < ApplicationController
  model_accessors NeedPost, queries: [:find], limit: 100

  def index
    if params[:filter] && params[:order] == "random"
      @instances = self.model.where(query_params).take_sample(query_limit)
    elsif params[:order] == "random"
      @instances = self.model.take_sample(query_limit)
    else
      @instances = self.model.where(query_params).limit(query_limit)
    end

    @serializer = self.serializer.new(@instances)
    respond_to do |format|
      format.jsonapi { render json: @serializer.serialized_json }
    end
  rescue ActionController::ParameterMissing
    render json: { error: error.message }, status: :unprocessable_entity
  end
end
