Vongole::Application.routes.draw do

  root :to => 'recommend#menu'

  # Recommend
  match 'menu' => 'recommend#menu'
  match 'place' => 'recommend#place'
  match 'pick/menu' => 'recommend#pick_menu'
  match 'pick/place' => 'recommend#pick_place'

end
