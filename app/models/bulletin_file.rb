class BulletinFile < ActiveRecord::Base
  attr_accessible :product_bulletin_id, :file
  mount_uploader :file, FileUploader
  belongs_to :product_bulletin
end
