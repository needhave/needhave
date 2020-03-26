Rails.application.routes.draw do
  # The SPA client application
  mount_ember_app :frontend, to: "/"

  # The HTTP API
  namespace :api, defaults: { format: :json } do
    resource 'entities'
    resource 'haves'
    resource 'needs'
  end
end
