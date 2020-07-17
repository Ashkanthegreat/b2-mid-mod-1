class AmusementPark < ApplicationRecord
  validates_presence_of :name,
                        :price

  has_many :rides
end
