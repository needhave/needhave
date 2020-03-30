class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  # Defines handlers for integration with '@ember/data'
  def self.model_accessors(
    queries: [:find, :query],
    includes: [],
    filters: [],
    limit: 10_000
  )
    self.instance_eval do
      class_attribute :model, default: "#{self.name.split('Controller')[0]}".singularize.constantize
      class_attribute :queries, default: queries
      class_attribute :allowed_limit, default: limit
      class_attribute :allowed_filter, default: filters
      class_attribute :allowed_includes, default: includes
      class_attribute :singular_name, default: self.model.name.underscore
      class_attribute :plural_name, default: self.model.name.underscore.pluralize
      class_attribute :serializer, default: "#{self.model.name.pluralize}Serializer".constantize
    end

    if queries.include?(:find)

      # Handler for `Model.findRecord` in the frontend
      def show
        @instance = self.model.includes(*include_params).find(params[:id])
        @serializer = self.serializer.new(@instance, include: include_params)
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
          @instances = self.model
            .includes(*include_params)
            .offset(query_offset)
            .limit(query_limit)
            .where(query_params)
        elsif self.queries.include?(:find_all)
          @instances = self.model
            .includes(*include_params)
            .limit(self.allowed_limit)
            .all
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
  end

  private

    # Default params for [strong parameters](https://guides.rubyonrails.org/action_controller_overview.html#strong-parameters)
    def query_params(*args)
      if args.length > 0
        params.require(:filter).permit(*args)
      elsif self.respond_to?(:allowed_filter)
        params.require(:filter).permit(*self.allowed_filter)
      end
    end

    # Default limit params for querying records
    def query_limit
      if params[:limit]
        limit = params[:limit].to_i  # defaults to 0
        if self.respond_to?(:allowed_limit) && !self.allowed_limit.nil?
          [limit, allowed_limit].min
        else
          limit
        end
      elsif self.respond_to?(:allowed_limit)
        self.allowed_limit
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

    # Default include params to join tables
    def include_params(*args)
      include_param = params.permit(:include)
      if include_param.is_a?(String)
        permitted = []
        if args.length > 0
          permitted = args
        elsif self.respond_to?(:allowed_includes)
          permitted = self.allowed_includes
        end

        include_param.split(',')
          .map(&:underscore)
          .map(&:to_sym) # NOTE: Symbols made with `to_sym` do get GC'd as of Ruby 2.2
          .filter { |incl| permitted.include? incl }
      else
        [nil] # NOTE: Argument to `Model.includes(*include_params)` can't be empty
      end
    end

  end
