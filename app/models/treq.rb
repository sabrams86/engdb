class Treq < ActiveRecord::Base
  has_many :treq_files
  accepts_nested_attributes_for :treq_files
  validates :test_number, :submitted_by, :pump_model, :description, presence: true
  validates :test_number, uniqueness: true

  scope :by_keyword, ->(keys=nil) {
    if keys.blank?
      
    else
      terms = keys.split(/\s*,\s*/).map { |t| t.strip }.map { |t| "%#{t}%" }
      where( ( ["#{table_name}.description like ?"] * terms.count).join(' and '), *terms )
    end
  }
  scope :by_pump_model, lambda { |pump_model| where('pump_model LIKE ?', "#{pump_model}%") unless pump_model.nil? }

  def incrament(treq)
    treq[:test_number] = Treq.maximum(:test_number) + 1
    return treq
  end

end
