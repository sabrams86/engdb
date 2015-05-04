class Capa < ActiveRecord::Base
 
  has_many :capa_files
  accepts_nested_attributes_for :capa_files

PUMP_MODELS = [ "A9", "A7", "AG", "AF", "S3", "Legacy", "K/Kpro", "EMW", "HD", "Non-Metallic" ]
STATUS = ["New", "In Process", "Resolved", "Closed"]
  validates :capa_number, :date, :description, :name, :department, presence: true
  validates :capa_number, uniqueness: true
  
  scope :by_keyword, ->(keys=nil) {
    if keys.blank?
      
    else
      terms = keys.split(/\s*,\s*/).map { |t| t.strip }.map { |t| "%#{t}%" }
      where( ( ["#{table_name}.description like ?"] * terms.count).join(' and '), *terms )
    end
  }
  scope :by_pump_model, lambda { |pump_model| where('pump_model LIKE ?', "#{pump_model}%") unless pump_model.nil? }
  scope :by_status, lambda { |status| where('status LIKE ?', "#{status}%") unless status.nil? }

  def incrament(product_bulletin)
    product_bulletin[:number] = ProductBulletin.maximum(:number) + 1
    return product_bulletin
  end
  
  
  
  
  
  
  
  def incrament(capa)
    items = Capa.where( [ 'capa_number LIKE ?' , 'C%' ] )
    max_value = 0
    items.each do |item|
      next if item.capa_number =~ /\A[A-Za-z]{3,}/
      capa_number = item.capa_number.gsub(/\AC/, '').to_i
      max_value = capa_number if capa_number > max_value
    end
    @max_num = max_value + 1
    if @max_num < 1000
      capa[:capa_number] = "C0" + @max_num.to_s
    else
      capa[:capa_number] = "C" + @max_num.to_s
    end
    return capa
  end

  def closed_status(capa)
    @capa = capa
    @capa[:status] = "Closed"
    return capa
  end  
  def assign_status(capa)
    @capa = capa
    @capa[:status] = "In Process"
    return capa
  end 
  def resolved_status(capa)
    @capa = capa
    @capa[:status] = "Resolved"
    return capa
  end 
  def new_status(capa)
    @capa = capa
    @capa[:status] = "New"
    return capa
  end  
end
