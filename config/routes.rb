Vongole::Application.routes.draw do

  # Administration
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users

  # Root
  root :to => 'home#entrance'

  # Recommend
  match 'menu' => 'recommend#menu'
  match 'place' => 'recommend#place'
  match 'menu/pick' => 'recommend#pick_menu'
  match 'place/pick' => 'recommend#pick_place'

end
