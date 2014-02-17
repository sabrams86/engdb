class AddRevisionToProductBulletins < ActiveRecord::Migration
  def change
    add_column :product_bulletins, :revision, :string

  end
end
