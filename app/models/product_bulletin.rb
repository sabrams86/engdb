class ProductBulletin < ActiveRecord::Base

  validates :number, :model, :subject, :written_by, presence: true
  validates :number, uniqueness: true

  def incrament(product_bulletin)
    product_bulletin[:number] = ProductBulletin.maximum(:number) + 1
    return product_bulletin
  end

end
