class Tag < ActiveRecord::Base

  has_many :taggings
  has_many :creatives, through: :taggings

end
