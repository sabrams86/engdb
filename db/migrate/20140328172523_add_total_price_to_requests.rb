class AddTotalPriceToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :total_price, :integer
  end
end
