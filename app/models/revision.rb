class Revision < ActiveRecord::Base
  belongs_to :drawing, foreign_key: :drawing_number
  belongs_to :ecn
  
  validates :drawing_number, :change, :rev_level, :disposition_wip, :disposition_inventory, presence: true
  
  DISPOSITION_TYPES = [ "N/A", "Use As Is", "Scrap", "Rework", "No Impact" ]
end
