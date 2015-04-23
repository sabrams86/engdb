class CapaFile < ActiveRecord::Base
  attr_accessible :capa_id, :file
  mount_uploader :file, FileUploader
  belongs_to :capa
end
