class Gage < ActiveRecord::Base
  attr_accessible :calibration_date, :calibration_period, :description, :gage_number, :gage_type, :location, :manufacturer, :servicing_company, :servicing_phone, :status

  validates :gage_number, :gage_type, :description, :rating, :calibration_last_done, :calibration_due, :calibration_period, :status, presence: true
  validates :gage_number, uniqueness: true

  PERIOD = [ "Yearly", "Every 3 Years", "Monthly" ]
  STATUS = [ "Active", "Decommissioned", "Out for Service" ]
end
