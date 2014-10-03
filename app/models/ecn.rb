class Ecn < ActiveRecord::Base
  has_many :revisions, :dependent => :destroy
  has_many :drawings, through: :revisions
  accepts_nested_attributes_for :revisions, :reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? }}, :allow_destroy => true
  accepts_nested_attributes_for :drawings
  belongs_to :user
  
  ECN_TYPES = [ "Drawing Change", "Document Change", "Product Bulletin", "Product Release", "Obsoletion", "Material Change", "Procedure Change" ]
  PRODUCT_LINES = [ "A9", "A7", "AG", "AF", "S3", "Legacy", "K/Kpro", "EMW", "HD", "Non-Metallic" ]
  
  validates :ecn_number, :ecn_type, :product_line, presence: true
  validates :ecn_number, uniqueness: true
  
  scope :by_open_ecns, lambda { where('status LIKE ?', false) }
  scope :by_ecn_number, lambda { |ecn_number| where("ecn_number LIKE?", "#{ecn_number}%") unless ecn_number.nil? || ecn_number.blank? }
  scope :by_user_name, lambda { |user_name| where("user_name LIKE?", "%#{user_name}%") unless user_name.nil? }
  scope :by_drawing_number, lambda { |drawing_number| 
    joins(:revisions).
    where("revisions.drawing_number LIKE ?", "%#{drawing_number}%") unless drawing_number.nil? 
    }
  scope :by_pump_model, ->(model=nil) {
    if model.blank?
      
    else
      terms = model.split(/\s*,\s*/).map { |t| t.strip }.map { |t| "%#{t}%" }
      where( ( ["#{table_name}.product_line like ?"] * terms.count).join(' and '), *terms )
    end
  }
  scope :by_ecn_type, lambda { |ecn_type| where("ecn_type LIKE ?", ecn_type) unless ecn_type.nil? or ecn_type == "" }
  scope :by_part_type, lambda { |part_type| 
    joins(:revisions).joins(:drawings).
    where("drawings.part_type LIKE ?", "%#{part_type}%") unless part_type.nil? }
  scope :by_created_before, lambda { |x,y,z| 
    d=Date.new(x.to_i, y.to_i, z.to_i)
    d.to_s
    where('created_on <= ?', d) } 
  scope :by_created_after, lambda { |x,y,z| 
    d=Date.new(x.to_i, y.to_i, z.to_i)
    d.to_s
    where('created_on >= ?', d) }
    

  def incrament(ecn)
    ecn[:ecn_number] = Ecn.maximum(:ecn_number) + 1
    return ecn
  end
  def close_status(ecn)
    @ecn = ecn
    @ecn[:status] = true
    return ecn
  end  
end
