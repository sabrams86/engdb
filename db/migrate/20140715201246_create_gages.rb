class CreateGages < ActiveRecord::Migration
  def change
    create_table :gages do |t|
      t.string :gage_number
      t.string :gage_type
      t.string :description
      t.string :location
      t.string :rating
      t.string :servicing_company
      t.string :servicing_phone
      t.string :calibration_period
      t.date :calibration_date

      t.timestamps
    end
  end
end
