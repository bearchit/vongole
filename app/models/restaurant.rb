class Restaurant
  include Mongoid::Document

  field :name, type: String
  field :address, type: String
  field :tel, type: String
  field :like, type: Integer
  field :dislike, type: Integer

  class << self
    def pick
      Restaurant.all.shuffle.last
    end
  end

end
