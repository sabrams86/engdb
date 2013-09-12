class AddStatusToEcns < ActiveRecord::Migration
  def change
    add_column :ecns, :status, :boolean

  end
end
