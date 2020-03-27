class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  # Defines handlers for integration with '@ember/data'
  def self.model_accessors(model, queries)
    self.instance_eval do
      class_attribute :model, default: model
      class_attribute :queries, default: queries
      class_attribute :serializer, default: "#{model.name.pluralize}Serializer".constantize
      class_attribute :singular_name, default: model.name.underscore
      class_attribute :plural_name, default: model.name.underscore.pluralize
    end

    # Handler for `Model.findRecord` in the frontend
    if queries.include? :find
      def show
        @instance = self.model.find(params[:id])
        @serializer = self.serializer.new(@instance)
        respond_to do |format|
          format.jsonapi { render json: @serializer.serialized_json }
        end
      end
    end

    # Handler for `Model.findAll` in the frontend
    if queries.include? :find_all
      def index
        @instances = self.model.all
        @serializer = self.serializer.new(@instances)
        respond_to do |format|
          format.jsonapi { render json: @serializer.serialized_json }
        end
      end
    end
  end
end
