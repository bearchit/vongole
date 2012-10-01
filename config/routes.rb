Vongole::Application.routes.draw do

  # Administration
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users

  # Root
  root :to => 'recommend#menu'

  # Recommend
  match 'menu' => 'recommend#menu'
  match 'place' => 'recommend#place'
  match 'pick/menu' => 'recommend#pick_menu'
  match 'pick/place' => 'recommend#pick_place'

end
