require 'spec_helper'

describe HomeController do

  describe "GET 'entrance'" do
    it "returns http success" do
      get 'entrance'
      response.should be_success
    end
  end

end
