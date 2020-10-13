class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :name, :email, :role, presence: true
  validates :email, uniqueness: true

  has_many :dubbings, class_name: "Dubbing", foreign_key: "voice_actor_id"
  has_many :dubbings, class_name: "Dubbing", foreign_key: "producer_id"
end
