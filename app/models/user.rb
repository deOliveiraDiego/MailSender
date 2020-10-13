class User < ApplicationRecord
  validates :name, :email, :role, presence: true
  validates :email, uniqueness: true
end
