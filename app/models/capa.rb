class Capa < ActiveRecord::Base
  attr_accessible :capa_number, :cause, :date, :date_assigned, :date_closed, :date_resolved, :department, :description, :engineer, :engr_comments, :follow_up_actions, :item_number, :name, :ncr, :pump_model, :quality_comments, :root, :solution, :status, :suggested
  has_many :capa_files
  accepts_nested_attributes_for :capa_files

PUMP_MODELS = [ "A9", "A7", "AG", "AF", "S3", "Legacy", "K/Kpro", "EMW", "HD", "Non-Metallic" ]

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
