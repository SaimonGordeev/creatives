class Image < ActiveRecord::Base

  belongs_to :gallery
  mount_uploader :path, PathUploader

end
