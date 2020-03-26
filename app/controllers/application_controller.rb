class ApplicationController < ActionController::API
  # Defines handlers for integration with '@ember/data'
  def self.resource(model, methods)
    class_variable_set(:@@model, model)
    class_variable_set(:@@serializer, "#{model.name.pluralize}Serializer".constantize)
    class_variable_set(:@@singular_name, model.name.underscore)
    class_variable_set(:@@plural_name, model.name.underscore.pluralize)
    class << self
      include ActionController::MimeResponds
    end

    # Handler for `Model.findRecord` in the frontend
    if methods.include? :find
      def show
        _instance = @@model.find(params[:id])
        instance_variable_set(@@singular_name, _instance)
        respond_to do |format|
          format.jsonapi {
            render jsonapi: _instance, include: params[:include]
          }
        end
      end
    end

    # Handler for `Model.findAll` in the frontend
    if methods.include? :find_all
      def index
        _instances = @@model.all
        instance_variable_set(@@plural_name, _instances)
        respond_to do |format|
          format.jsonapi {
            render jsonapi: _instances, include: params[:include]
          }
        end
      end
    end
  end
end
