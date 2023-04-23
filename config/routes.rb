Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  root to: "pages#home"

  get "/testing", to: "pages#testing"

  resources :users, except: [:index, :destroy]
  resources :play, only: [:index]
  resources :stories do
  	resources :chapters do
      resources :lines, except: [:show] do 
        put :update_options
      end
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
