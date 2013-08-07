FirstRoutesAndController::Application.routes.draw do


  resources :users, :except => [:new, :edit] do
    resources :contacts, :only => [:index, :create]
    resources :favorites, :only => [:index, :create]
  end

  resources :contacts, :except => [:index, :create, :new, :edit]
  resources :favorites, :except => [:index, :create, :new, :edit]

end
