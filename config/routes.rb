Rails.application.routes.draw do
  root "pages#index"
  # get "pages/index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :channels, only: [:new, :create, :show] do
    resources :messages do
      collection do
        post :create
        get :edit
        post :update
        delete :destroy
      end
    end
  end

  resources :users, only: [:create] do
    collection do
      get :sign_up
      get :edit
      patch :update
      get :sign_in
      post :login
      delete :sign_out
    end
  end
end
