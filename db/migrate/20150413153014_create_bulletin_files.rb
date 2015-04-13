class CreateBulletinFiles < ActiveRecord::Migration
  def change
    create_table :bulletin_files do |t|
      t.integer :product_bulletin_id
      t.string :file

      t.timestamps
    end
  end
end
