Rails.application.routes.draw do
  resources :need_categories
  resources :locations
  # The SPA client application
  mount_ember_app :frontend, to: "/"

  # The HTTP API
  scope '/api' do
    resources 'entities', except: [:new, :edit]
    resources 'have_posts', except: [:new, :edit]
    resources 'need_posts', except: [:new, :edit]
  end
end
