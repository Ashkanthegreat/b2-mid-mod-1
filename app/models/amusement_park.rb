class AmusementPark < ApplicationRecord
  validates_presence_of :name,
                        :price

  has_many :rides

  def thrill
    rides.average(:thrill_rating)
  end

  def alphabetical
    rides.order(:name)
  end
end
