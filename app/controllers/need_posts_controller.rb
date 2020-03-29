class NeedPostsController < ApplicationController
  model_accessors NeedPost, [:find]

  def index
    @instances = self.model.order("RANDOM()").all
    @serializer = self.serializer.new(@instances)
    respond_to do |format|
      format.jsonapi { render json: @serializer.serialized_json }
    end
  end
end
