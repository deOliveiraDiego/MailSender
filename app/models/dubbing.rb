class Dubbing < ApplicationRecord
  belongs_to :producer, class_name: "User"
end
