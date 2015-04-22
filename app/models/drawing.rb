class Drawing < ActiveRecord::Base
  #comment
  
  has_many :revisions
  
  PART_TYPES = [ "Impeller", "Case", "Wet End Component", "Seal Component", "Power End Component", "Auxilliary Component" ]
  
  validates :drawing_number, :item_number, :description, :pump_model, :frame_size, :make_from, :file_format, :file_location, :part_type, presence: true
  validates :drawing_number, uniqueness: true
  
  scope :by_description, ->(desc=nil) {
    if desc.blank?
      
    else
      terms = desc.split(/\s*,\s*/).map { |t| t.strip }.map { |t| "%#{t}%" }
      where( ( ["#{table_name}.description like ?"] * terms.count).join(' and '), *terms )
    end
  }
  scope :by_drawing_number, ->(dnum=nil) {
    if dnum.blank?
      
    else
    match = dnum.tr('?*', '_%')
    where('drawing_number LIKE ?', match)
    end
    }
  scope :by_item_number, ->(inum=nil) {
    if inum.blank?
      
    else
    match = inum.tr('?*', '_%')
    where('item_number LIKE ?', match)
    end
    }
  scope :by_pump_model, ->(model=nil) {
    if model.blank?
      
    else
      terms = model.split(/\s*,\s*/).map { |t| t.strip }.map { |t| "%#{t}%" }
      where( ( ["#{table_name}.pump_model like ?"] * terms.count).join(' or '), *terms )
    end
  }
  scope :by_frame_size, ->(size=nil) {
    if size.blank?
      
    else
      terms = size.split(/\s*,\s*/).map { |t| t.strip }.map { |t| "%#{t}%" }
      where( ( ["#{table_name}.frame_size like ?"] * terms.count).join(' or '), *terms )
    end
  }
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

  def incrament_rd(drawing)
    items = Drawing.where( [ 'drawing_number LIKE ?' , 'RD%' ] )
    max_value = 0
    items.each do |item|
      next if item.drawing_number =~ /\A[A-Za-z]{3,}/
      drawing_number = item.drawing_number.gsub(/\ARD/, '').to_i
      max_value = drawing_number if drawing_number > max_value
    end
    @max_num = max_value + 1
    if @max_num < 1000
      drawing[:drawing_number] = "RD0" + @max_num.to_s
    else
      drawing[:drawing_number] = "RD" + @max_num.to_s
    end
    return drawing
  end
  
  def incrament_wp(drawing)
    items = Drawing.where( [ 'drawing_number LIKE ?' , 'WP%' ] )
    max_value = 0
    items.each do |item|
      next if item.drawing_number =~ /\A[A-Za-z]{3,}/
      drawing_number = item.drawing_number.gsub(/\AWP/, '').to_i
      max_value = drawing_number if drawing_number > max_value
    end
    @max_num = max_value + 1
    if @max_num < 1000
      drawing[:drawing_number] = "WP0" + @max_num.to_s
    else
      drawing[:drawing_number] = "WP" + @max_num.to_s
    end
    return drawing
  end

  def draw_path(drawing)
    folder = drawing[:file_location]
    file_name = drawing[:drawing_number]
    path = Dir["~/.gvfs/engineering\ on\ engserver/engineering/shop\ prints/#{folder}/#{file_name}*"].first
    return path
  end

#this method is in progress, not yet working.  Goal is to sort description keywords by AND, then by OR
  def self.sort_data(terms)
    results_array = @drawings
    result = []
    results_array.each do |string|
      every_word = true
      one_word = false

      terms.each do |search|
        if string.downcase.include? search.downcase
            one_word = true
        else
            every_word = false
        end
      end
      if every_word
        result.unshift(string)
      elsif one_word
        result << string
      end
    end
    return result
  end
  
end
