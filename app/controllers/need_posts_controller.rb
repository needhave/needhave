class NeedPostsController < ApplicationController
  model_accessors ({
    queries: [:find],
    includes: [:category, :entity, :location],
    filters: [:category_id],
    limit: 100
  })

  def index
    if params[:filter] && params[:order] == "random"
      @instances = self.model
        .where(query_params)
        .includes(*include_params)
        .take_sample(query_limit)
    elsif params[:order] == "random"
      @instances = self.model
        .includes(*include_params)
        .take_sample(query_limit)
    elsif params[:filter]
      @instances = self.model
        .includes(*include_params)
        .offset(query_offset)
        .limit(query_limit)
        .where(query_params)
    else
      params.require(:filter) # throws error
    end

    @serializer = self.serializer.new(@instances, include: include_params)
    respond_to do |format|
      format.jsonapi { render json: @serializer.serialized_json }
    end
  rescue ActionController::ParameterMissing
    render json: { error: error.message }, status: :unprocessable_entity
  end
end
