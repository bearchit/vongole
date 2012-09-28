Vongole::Application.routes.draw do

  root :to => 'home#entrance'

  # Recommend
  match 'menu' => 'recommend#menu'
  match 'place' => 'recommend#place'
  match 'menu/pick' => 'recommend#pick_menu'
  match 'place/pick' => 'recommend#pick_place'

end
