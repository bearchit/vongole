class RecommendController < ApplicationController
  def menu
    @menus = Menu.pick(2)
  end

  def restaurant
    @restaurants = Restaurant.pick(2)
  end
end
