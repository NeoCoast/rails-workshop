Rails.application.routes.draw do
  
  defaults formats: :json do
    namespace :api do
      namespace :v1 do
        resources :users, only: [:create, :index, :show] do
          resources :posts, only: [:create, :index, :show, :destroy], shallow: true do
            resources :comments, only: [:create]
          end

          member do
            put :follow
            get :followers
            get :followees
          end
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
