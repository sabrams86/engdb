class AddBillingToRequestItems < ActiveRecord::Migration
  def change
    add_column :request_items, :billing, :string
  end
end
