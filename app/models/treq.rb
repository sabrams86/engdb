class Treq < ActiveRecord::Base

  validates :test_number, :submitted_by, :pump_model, :description, presence: true
  validates :test_number, uniqueness: true

  def incrament(treq)
    treq[:test_number] = Treq.maximum(:test_number) + 1
    return treq
  end

end
