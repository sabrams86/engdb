class Ecn < ActiveRecord::Base
  has_many :revisions, :dependent => :destroy
  has_many :drawings, through: :revisions
  accepts_nested_attributes_for :revisions, :reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? }}, :allow_destroy => true
  accepts_nested_attributes_for :drawings
  belongs_to :user
  
  ECN_TYPES = [ "Drawing Change", "Document Change", "Product Bulletin", "Product Release", "Obsoletion", "Material Change", "Procedure Change" ]
  
  scope :by_ecn_number, lambda { |ecn_number| where(ecn_number: ecn_number) unless ecn_number.nil? }
#  scope :by_user_name, lambda { |user_name| where(user_name: user_name) unless user_name.nil? }
  scope :by_drawing_number, lambda { |drawing_number| Revision.where("drawing_number LIKE ?", "%#{drawing_number}%").map(&:ecn) unless drawing_number.nil? }
  scope :by_pump_model, lambda { |pump_model| where("product_line LIKE ?", "%#{pump_model}%") unless pump_model.nil? }
  scope :by_frame, lambda { |frame| Drawing.where("frame_size LIKE ?", "%#{frame}%").map(&:ecn) unless frame.nil? }
  scope :by_ecn_type, lambda { |ecn_type| where("ecn_type LIKE ?", "%#{ecn_type}%") unless ecn_type.nil? }
  scope :by_part_type, lambda { |part_type| Drawing.where("part_type LIKE ?", "%#{part_type}%").map(&:ecn) unless part_type.nil? }
  scope :by_created_before, lambda { |x,y,z| 
    d=Date.new(x.to_i, y.to_i, z.to_i)
    d.to_s
    where('created_on <= ?', d) unless d.nil? } 
  scope :by_created_after, lambda { |x,y,z| 
    d=Date.new(x.to_i, y.to_i, z.to_i)
    d.to_s
    where('created_on >= ?', d) unless d.nil? }
    
  @@incrament_number = 1989
  def self.num_up
      @@incrament_number += 1
  end
  def incrament(ecn)
    ecn[:ecn_number] = @@incrament_number
    return ecn
  end
    
end
