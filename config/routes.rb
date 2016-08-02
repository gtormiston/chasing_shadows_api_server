Rails.application.routes.draw do

  # constraints subdomain 'api' do
    #scope module: 'api' do
      namespace :api do
        namespace :v1 do
          resources :users, :enemies
          resources :sessions, only: [:create, :destroy]
        end
      end
    # end
  # end

  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
