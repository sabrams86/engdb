class Drawing < ActiveRecord::Base
  has_many :revisions
  
  PART_TYPES = [ "Impeller", "Case", "Wet End Component", "Seal Component", "Power End Component", "Auxilliary Component" ]
  
  validates :drawing_number, :item_number, :description, :pump_model, :frame_size, :make_from, :file_format, :file_location, :part_type, presence: true
  validates :drawing_number, uniqueness: true
  
  scope :by_description, lambda { |description| where('description LIKE ?', "%#{description}%") unless description.nil? }
  scope :by_drawing_number, lambda { |drawing_number| where('drawing_number LIKE ?', "%#{drawing_number}%") unless drawing_number.nil? }
  scope :by_item_number, lambda { |item_number| where('item_number LIKE ?', "%#{item_number}%") unless item_number.nil? }
  scope :by_pump_model, lambda { |pump_model| where('pump_model LIKE ?', "%#{pump_model}%") unless pump_model.nil? }
  scope :by_frame_size, lambda { |frame_size| where('frame_size LIKE ?', "%#{frame_size}%") unless frame_size.nil? }
  scope :by_part_type, lambda { |part_type| where('part_type LIKE ?', "%#{part_type}%") unless part_type.nil? }
  scope :by_created_before, lambda { |x,y,z| 
    d=Date.new(x.to_i, y.to_i, z.to_i)
    d.to_s
    where('created_on <= ?', d) unless d.nil? } 
    
  scope :by_created_after, lambda { |x,y,z| 
    d=Date.new(x.to_i, y.to_i, z.to_i)
    d.to_s
    where('created_on >= ?', d) unless d.nil? }
  
  @@incrament_number = 3100
  def self.num_up
      @@incrament_number += 1
  end
  def incrament(drawing)
    drawing[:drawing_number] = "A"+@@incrament_number.to_s
    return drawing
  end



#  def self.drawsearch
#    self.by_description(params[:drawings][:description]).by_drawing_number(params[:drawings][:drawing_number]).\
#    by_item_number(params[:drawings][:item_number]).by_pump_model(params[:drawings][:pump_model]).by_frame_size(params[:drawings]\
#    [:frame_size]).by_part_type(params[:drawings][:part_type]).by_created_before(params[:drawings][:created_on].to_a.to_s).\
#    by_created_after(params[:drawings][:created_on]).all  
#  end

end
