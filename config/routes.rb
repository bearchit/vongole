Vongole::Application.routes.draw do

  # Administration
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users

  # Root
  root :to => 'menus#index'

  # Recommend
  get 'recommend/menu'
  get 'recommend/place'
  get 'recommend/pick_menu'
  get 'recommend/pick_place'

  # Menu
  resources :menus, except: [:new, :edit]

  # Restaurant
  resources :restaurants, except: [:new, :edit,]

end
