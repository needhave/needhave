class ApplicationController < ActionController::API
  include ActionController::MimeResponds


  # Defines handlers for integration with '@ember/data'
  def self.model_accessors(model, queries: [:find, :query], limit: 10_000)
    self.instance_eval do
      class_attribute :model, default: model
      class_attribute :queries, default: queries
      class_attribute :max_instances, default: limit
      class_attribute :singular_name, default: model.name.underscore
      class_attribute :plural_name, default: model.name.underscore.pluralize
      class_attribute :serializer, default: "#{model.name.pluralize}Serializer".constantize
    end

    if queries.include?(:find)

      # Handler for `Model.findRecord` in the frontend
      def show
        @instance = self.model.find(params[:id])
        @serializer = self.serializer.new(@instance)
        respond_to do |format|
          format.jsonapi { render json: @serializer.serialized_json }
        end

      rescue ActiveRecord::RecordNotFound
        render json: { error: error.message }, status: :not_found
      end

    end

    if queries.include?(:find_all) || queries.include?(:query)

      # Handler for `Model.findAll` and `Model.queryRecord` and `Model.query` in the frontend
      def index
        if params[:filter] && self.queries.include?(:query)
          @instances = self.model.where(query_params).limit(query_limit).offset(query_offset)
        elsif self.queries.include?(:find_all)
          @instances = self.model.all.limit(self.max_instances)
        else
          params.require(:filter) # throws error
        end

        @serializer = self.serializer.new(@instances)
        respond_to do |format|
          format.jsonapi { render json: @serializer.serialized_json }
        end

      rescue ActionController::ParameterMissing
        render json: { error: error.message }, status: :unprocessable_entity
      end

    end
  end

  private

    # Default params for [strong parameters](https://guides.rubyonrails.org/action_controller_overview.html#strong-parameters)
    def query_params
      params.require(:filter).permit(:created_at, :update_at)
    end

    # Default limit params for querying records
    def query_limit
      if params[:limit]
        limit = params[:limit].to_i  # defaults to 0
        if self.respond_to?(:max_instances) && !self.max_instances.nil?
          [limit, max_instances].min
        else
          limit
        end
      elsif self.respond_to?(:max_instances)
        self.max_instances
      else
        10_000
      end
    end

    # Default offset params for querying records
    def query_offset
      if params[:offset]
        params[:offset].to_i  # defaults to 0
      else
        nil
      end
    end

end
