class Ecn < ActiveRecord::Base
  has_many :revisions, :dependent => :destroy
  has_many :drawings, through: :revisions
  accepts_nested_attributes_for :revisions, :reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? }}, :allow_destroy => true
  
  scope :by_ecn_number, lambda { |ecn_number| where(ecn_number: ecn_number) unless ecn_number.nil? }
  scope :by_user_name, lambda { |user_name| where(user_name: user_name) unless user_name.nil? }
  scope :by_drawing_number, lambda { |drawing_number| joins(:drawings).where(drawings: {drawing_number: drawing_number}) unless drawing_number.nil? }
#  scope :by_pump_model, lambda { |pump_model| where('product_line LIKE ?', "%#{pump_model}%") unless pump_model.nil? }
#  scope :by_frame, lambda { |frame| joins(:drawings).where(drawings: {'frame_size LIKE ?', "%#{frame}%"}) unless frame.nil? }
#  scope :by_part_type, lambda { |part_type| joins(:drawings).where(drawings: {'part_type LIKE ?', "%#{part_type}%"}) unless part_type.nil? }
#  scope :by_created_before, lambda { |x,y,z| 
#    d=Date.new(x.to_i, y.to_i, z.to_i)
#    d.to_s
#    where('created_on <= ?', d) unless d.nil? } 
#  scope :by_created_after, lambda { |x,y,z| 
#    d=Date.new(x.to_i, y.to_i, z.to_i)
#    d.to_s
#    where('created_on >= ?', d) unless d.nil? }
    
    def self.match_drawing(drawing_number)
        @drawing = Drawing.where(drawing_number: :drawing_number)
        params[:ecns][:revisions][:drawing_id] = @drawing.id
    end
end
