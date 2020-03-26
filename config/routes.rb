Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # The SPA client application
  mount_ember_app :frontend, to: "/"

  # The HTTP api
  namespace :api, defaults: { format: :json } do
    # List resources here
  end
end
