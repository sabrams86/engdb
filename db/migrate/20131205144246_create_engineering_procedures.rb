class CreateEngineeringProcedures < ActiveRecord::Migration
  def change
    create_table :engineering_procedures do |t|
      t.string :procedure_number
      t.string :title
      t.text :description
      t.date :created_on
      t.string :created_by
      t.text :comments

      t.timestamps
    end
  end
end
