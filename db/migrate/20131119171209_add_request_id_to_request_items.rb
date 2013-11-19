class AddRequestIdToRequestItems < ActiveRecord::Migration
  def change
    add_column :request_items, :request_id, :integer

  end
end
