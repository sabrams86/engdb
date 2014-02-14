class CreateTreqs < ActiveRecord::Migration
  def change
    create_table :treqs do |t|
      t.integer :test_number
      t.date :date_recieved
      t.string :submitted_by
      t.string :pump_model
      t.string :technician
      t.date :date_complete
      t.text :description

      t.timestamps
    end
  end
end
