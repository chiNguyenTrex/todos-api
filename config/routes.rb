Rails.application.routes.draw do
  resources :todos do
    resources :items, shallow: true
  end
end
