require "rails/generators/rails/model/model_generator"

class ResourceGenerator < Rails::Generators::ModelGenerator
  def create_controller
    create_file "app/controllers/#{file_name.pluralize}_controller.rb", <<~FILE
      class #{class_name.pluralize}Controller < ApplicationController
        model_accessors #{class_name}, [:find, :find_all]
      end
    FILE
  end

  def create_serializer
    create_file "app/serializers/#{file_name}_serializer.rb", <<~FILE
      # KEEP UPDATED WITH:
      #
      #   frontend/app/models/#{file_name.dasherize}.js
      #
      class #{class_name.pluralize}Serializer
        include FastJsonapi::ObjectSerializer
        set_key_transform :unaltered

        # ... add attributes here ...
      end
    FILE
  end

  def create_ember_model
    create_file "frontend/app/models/#{file_name.dasherize}.js", <<~FILE
      import Model, { attr } from '@ember-data/model';

      // KEEP UPDATED WITH:
      //
      //   app/serializers/#{file_name.pluralize}_serializer.rb
      //
      export default class #{class_name}Model extends Model {
        // ... add `@attr whatever` here ...
      }
    FILE
  end

  def define_route
    sentinel = /scope '\/api'.*\s*do\n/m
    routing_code = "resources '#{file_name.pluralize}', except: [:new, :edit]"
    log :route, routing_code
    in_root do
      inject_into_file "config/routes.rb", optimize_indentation(routing_code, 4), after: sentinel, verbose: false, force: false
    end
  end
end
