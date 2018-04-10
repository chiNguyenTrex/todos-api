Rails.application.routes.draw do
  resources :todos do
    resources :items, shallow: true
  end

  post "/login", to: "authentication#authenticate"
  post "/register", to: "users#create"
end
