Rails.application.routes.draw do
  resources :rooms do
    member do
      post :start
      post :stop
    end
  end

  root 'welcome#index'
end
