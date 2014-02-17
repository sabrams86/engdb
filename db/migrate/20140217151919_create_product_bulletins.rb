class CreateProductBulletins < ActiveRecord::Migration
  def change
    create_table :product_bulletins do |t|
      t.integer :number
      t.date :date_created
      t.string :model
      t.text :subject
      t.string :written_by

      t.timestamps
    end
  end
end
