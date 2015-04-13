class AddProductBulletinIdToBulletinFiles < ActiveRecord::Migration
  def change
    add_column :bulletin_files, :product_bulletin_id, :integer
  end
end
