class AddStatusToGages < ActiveRecord::Migration
  def change
    add_column :gages, :status, :string
  end
end
