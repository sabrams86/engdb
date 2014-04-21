class AddManufacturingNotesToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :manufacturing_notes, :text
  end
end
