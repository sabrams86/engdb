class Revision < ActiveRecord::Base
  belongs_to :drawing, foreign_key: :drawing_number
  belongs_to :ecn
  
  DISPOSITION_TYPES = [ "N/A", "Use As Is", "Scrap", "Rework", "No Impact" ]
end
