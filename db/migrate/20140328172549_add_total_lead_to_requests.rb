class AddTotalLeadToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :total_lead, :string
  end
end
