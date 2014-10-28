class AddDeliverableToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :deliverable, :string
  end
end
