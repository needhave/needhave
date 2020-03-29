Rails.application.routes.draw do
  resources :locations
  # The SPA client application
  mount_ember_app :frontend, to: "/"

  # The HTTP API
  scope '/api' do
    resources 'entities', except: [:new, :edit]
    resources 'haves', except: [:new, :edit]
    resources 'needs', except: [:new, :edit]
  end
end
