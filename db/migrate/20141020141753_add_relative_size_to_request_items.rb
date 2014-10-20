class AddRelativeSizeToRequestItems < ActiveRecord::Migration
  def change
    add_column :request_items, :relative_size, :string
  end
end
