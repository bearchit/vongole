Vongole::Application.routes.draw do

  # Administration
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users

  # Root
  root :to => 'menus#index'

  # Recommend
  get 'recommend/menu'
  get 'recommend/restaurant'

  # Menu
  resources :menus, except: [:new, :edit]

  # Restaurant
  resources :restaurants, except: [:new, :edit,]

end
