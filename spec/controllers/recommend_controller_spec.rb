require 'spec_helper'

describe RecommendController do

  describe "GET 'menu'" do
    it "returns http success" do
      get 'menu'
      response.should be_success
    end
  end

  describe "GET 'place'" do
    it "returns http success" do
      get 'place'
      response.should be_success
    end
  end

  describe "GET 'pick_menu'" do
    it "returns http success" do
      get 'pick_menu'
      response.should be_success
    end
  end

  describe "GET 'pick_place'" do
    it "returns http success" do
      get 'pick_place'
      response.should be_success
    end
  end

end
