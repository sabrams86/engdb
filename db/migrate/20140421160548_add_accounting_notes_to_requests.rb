class AddAccountingNotesToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :accounting_notes, :text
  end
end
