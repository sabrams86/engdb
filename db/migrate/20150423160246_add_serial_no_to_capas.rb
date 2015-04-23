class AddSerialNoToCapas < ActiveRecord::Migration
  def change
    add_column :capas, :serial_no, :string
  end
end
