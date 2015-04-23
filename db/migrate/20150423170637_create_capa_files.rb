class CreateCapaFiles < ActiveRecord::Migration
  def change
    create_table :capa_files do |t|
      t.integer :capa_id
      t.string :file

      t.timestamps
    end
  end
end
