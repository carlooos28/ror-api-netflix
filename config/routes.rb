Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/health', to: 'health#health'

 namespace :api, constraints: { format: :json } do
    namespace :v1 do
      resources :movies, only: [:index, :create]
    end
  end
  
end