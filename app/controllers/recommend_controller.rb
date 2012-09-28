class RecommendController < ApplicationController
  def menu
    @menus = Menu.all
  end

  def place
    @restaurants = Restaurant.all
  end

  def pick_menu
    @menu = Menu.pick
  end

  def pick_place
    @restaurant = Restaurant.pick
  end
end
