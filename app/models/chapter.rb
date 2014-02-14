class Chapter < ActiveRecord::Base

  belongs_to :creative
  acts_as_list

end
