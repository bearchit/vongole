class RecommendController < ApplicationController
  def menu
    @menu = Menu.pick

    render 'menus/show'
  end

  def restaurant
    @restaurant = Restaurant.pick

    render 'restaurants/show'
  end
end
