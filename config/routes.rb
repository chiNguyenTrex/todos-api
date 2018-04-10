Rails.application.routes.draw do
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :todos do
      resources :items, shallow: true
    end
  end

  post "/login", to: "authentication#authenticate"
  post "/register", to: "users#create"
end
