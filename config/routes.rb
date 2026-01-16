Rails.application.routes.draw do
  resources :articles, only: %i[index show]
  get 'up' => 'rails/health#show', as: :rails_health_check
end
