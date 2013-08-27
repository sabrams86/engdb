class CreateEcns < ActiveRecord::Migration
  def change
    create_table :ecns do |t|
      t.integer :ecn_number
      t.string :ecn_type
      t.string :product_line
      t.date :created_on
      t.boolean :distribute_engineering
      t.boolean :distribute_purchasing
      t.boolean :distribute_planning
      t.boolean :distribute_manufacturing
      t.boolean :distribute_qantel
      t.boolean :distribute_sales
      t.boolean :distribute_inventory
      t.boolean :distribute_quality
      t.boolean :distribute_india
      t.boolean :distribute_finance

      t.timestamps
    end
  end
end
