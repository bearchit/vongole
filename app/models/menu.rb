class Menu
  include Mongoid::Document

  # Association
  has_and_belongs_to_many :restaurants, index: true

  # Field
  field :name, type: String
  field :price, type: Integer
  field :like, type: Integer
  field :dislike, type: Integer


  # ============================================================

  class << self
    def pick
      Menu.all.shuffle.last
    end
  end

end
