Rails.application.routes.draw do
  root to: "pages#home"

  resources :users

  resources :stories

  resources :sessions, only: [:new, :create] do 
    collection do 
      delete :destroy
    end
  end
end
