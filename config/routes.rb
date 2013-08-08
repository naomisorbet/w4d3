FirstRoutesAndController::Application.routes.draw do


  resources :users, :except => [:new, :edit] do
    resources :contacts, :only => [:index, :create, :show, :update, :destroy]
    resources :favorites, :only => [:index, :create,:show, :update, :destroy]
  end

  # resources :contacts, :except => [:index, :create, :new, :edit]
  # resources :favorites, :except => [:index, :create, :new, :edit]

end
