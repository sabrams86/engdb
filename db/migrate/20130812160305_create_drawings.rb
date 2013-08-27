class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.string :drawing_number
      t.string :item_number
      t.string :description
      t.string :pump_model
      t.string :frame_size
      t.date :created_on
      t.string :make_from
      t.string :file_format
      t.string :file_location
      t.string :part_type
      t.text :comments

      t.timestamps
    end
  end
end
