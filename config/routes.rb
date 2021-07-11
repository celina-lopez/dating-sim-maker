Rails.application.routes.draw do
  root to: "pages#home"
  get "/testing", to: "pages#testing"

  resources :users, except: [:index, :destroy]

  resources :stories do
  	resources :chapters do
      resources :lines, except: [:show]
    end
    resources :endings, except: [:index, :show]
    resources :storycharacters
    resources :play, only: [:show]
  end
  resources :characters

  resources :sessions, only: [:new, :create] do 
    collection do 
      delete :destroy, only: [:index, :new, :create, :destroy]
    end
  end
end
