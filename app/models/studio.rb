class Studio < ApplicationRecord
  before_save { self.name.upcase! }

  validates :name, presence: true

  has_many :dubbings
end
