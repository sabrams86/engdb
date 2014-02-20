class Drawing < ActiveRecord::Base
  #comment
  
  has_many :revisions
  
  PART_TYPES = [ "Impeller", "Case", "Wet End Component", "Seal Component", "Power End Component", "Auxilliary Component" ]
  
  validates :drawing_number, :item_number, :description, :pump_model, :frame_size, :make_from, :file_format, :file_location, :part_type, presence: true
  validates :drawing_number, uniqueness: true
  
  scope :by_description, lambda { |description| where('description LIKE ?', "%#{description}%") unless description.nil? }
  scope :by_drawing_number, lambda { |drawing_number| where('drawing_number LIKE ?', "#{drawing_number}%") unless drawing_number.nil? }
  scope :by_item_number, lambda { |item_number| where('item_number LIKE ?', "#{item_number}%") unless item_number.nil? }
  scope :by_pump_model, lambda { |pump_model| where('pump_model LIKE ?', "%#{pump_model}%") unless pump_model.nil? }
  scope :by_frame_size, lambda { |frame_size| where('frame_size LIKE ?', "%#{frame_size}%") unless frame_size.nil? }
  scope :by_part_type, lambda { |part_type| where('part_type LIKE ?', "%#{part_type}%") unless part_type.nil? }
  scope :by_created_before, lambda { |x,y,z| 
    d=Date.new(x.to_i, y.to_i, z.to_i)
    d.to_s
    where('created_on <= ?', d) } 
    
  scope :by_created_after, lambda { |x,y,z| 
    d=Date.new(x.to_i, y.to_i, z.to_i)
    d.to_s
    where('created_on >= ?', d) }
  

  
  def incrament(drawing)
    items = Drawing.where( [ 'drawing_number LIKE ?' , 'A%' ] )
    max_value = 0
    items.each do |item|
      next if item.drawing_number =~ /\A[A-Za-z]{2,}/
      drawing_number = item.drawing_number.gsub(/\AA/, '').to_i
      max_value = drawing_number if drawing_number > max_value
    end
    @max_num = max_value + 1
    drawing[:drawing_number] = "A" + @max_num.to_s
    return drawing
  end
  
  def incrament_e(drawing)
    items = Drawing.where( [ 'drawing_number LIKE ?' , 'E%' ] )
    max_value = 0
    items.each do |item|
      next if item.drawing_number =~ /\A[A-Za-z]{2,}/
      drawing_number = item.drawing_number.gsub(/\AE/, '').to_i
      max_value = drawing_number if drawing_number > max_value
    end
    @max_num = max_value + 1
    if @max_num < 1000
      drawing[:drawing_number] = "E0" + @max_num.to_s
    else
      drawing[:drawing_number] = "E" + @max_num.to_s
    end
    return drawing
  end

  def draw_path(drawing)
    folder = drawing[:file_location]
    file_name = drawing[:drawing_number]
      path = Dir["~/.gvfs/engineering\ on\ engserver/shop\ prints/#{folder}/#{file_name}*"].first
    return path
  end

end
