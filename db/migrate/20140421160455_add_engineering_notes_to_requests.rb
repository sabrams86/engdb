class AddEngineeringNotesToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :engineering_notes, :text
  end
end
