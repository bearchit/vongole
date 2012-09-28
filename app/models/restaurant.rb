class Restaurant
  include Mongoid::Document

  # Association
  has_and_belongs_to_many :menus, index: true

  # Field
  field :name, type: String
  field :address, type: String
  field :tel, type: String
  field :like, type: Integer
  field :dislike, type: Integer
  field :location, type: Array

  # Index
  index({ location: "2d" })


  # ============================================================

  class << self
    def pick
      Restaurant.all.shuffle.last
    end
  end

end
