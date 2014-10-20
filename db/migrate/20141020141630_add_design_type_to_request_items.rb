class AddDesignTypeToRequestItems < ActiveRecord::Migration
  def change
    add_column :request_items, :design_type, :string
  end
end
