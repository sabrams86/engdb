class TreqFile < ActiveRecord::Base
  attr_accessible :file, :treq_id  
  mount_uploader :file, FileUploader
  belongs_to :treq
end
