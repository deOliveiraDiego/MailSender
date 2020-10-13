class Studio < ApplicationRecord
  belongs_to :director, class_name: "User"

end
