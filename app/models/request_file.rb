class RequestFile < ActiveRecord::Base
  attr_accessible :file, :request_id
  mount_uploader :file, FileUploader
  belongs_to :request
end
