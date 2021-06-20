Rails.application.routes.draw do
  root to: "pages#home"

  resources :users, only: [:edit, :create, :new, :show]

  resources :stories do 
  	resources :chapters do
      resources :lines, except: [:show]
    end
    resources :storycharacters
  end
  resources :characters

  resources :sessions, only: [:new, :create] do 
    collection do 
      delete :destroy, only: [:index, :new, :create, :destroy]
    end
  end
end
