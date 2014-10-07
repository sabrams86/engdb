class CreateRequestFiles < ActiveRecord::Migration
  def change
    create_table :request_files do |t|
      t.integer :request_id
      t.string :file

      t.timestamps
    end
  end
end
