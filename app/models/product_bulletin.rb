class ProductBulletin < ActiveRecord::Base
  has_many :bulletin_files
  accepts_nested_attributes_for :bulletin_files
  
  validates :number, :model, :subject, :written_by, presence: true
  validates :number, uniqueness: true

  scope :by_keyword, ->(keys=nil) {
    if keys.blank?
      
    else
      terms = keys.split(/\s*,\s*/).map { |t| t.strip }.map { |t| "%#{t}%" }
      where( ( ["#{table_name}.subject like ?"] * terms.count).join(' and '), *terms )
    end
  }
  scope :by_model, lambda { |model| where('model LIKE ?', "#{model}%") unless model.nil? }

  def incrament(product_bulletin)
    product_bulletin[:number] = ProductBulletin.maximum(:number) + 1
    return product_bulletin
  end

end
