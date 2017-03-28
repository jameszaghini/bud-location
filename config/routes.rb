Rails.application.routes.draw do
  

  resources :locations
  resources :sessions
  resources :buds

  root 'sessions#index'

  scope '/api' do
    scope '/v1' do
      scope '/locations' do
        post '/' => 'api_locations#create'
      end
    end
  end

end
