Rails.application.routes.draw do
  root to: "pages#home"

  resources :users

  resources :stories do 
  	resources :chapters do
      resources :lines
    end
    resources :storycharacters
  end
  resources :characters

  resources :sessions, only: [:new, :create] do 
    collection do 
      delete :destroy
    end
  end
end
