class ChangeToFloat < ActiveRecord::Migration
  def up
    change_column :requests, :total_price, :decimal, :precision => 9, :scale => 2
    change_column :request_items, :final_price, :decimal, :precision => 9, :scale => 2
    change_column :request_items, :purch_cost, :decimal, :precision => 9, :scale => 2
    change_column :request_items, :acct_price, :decimal, :precision => 9, :scale => 2
  end

  def down
    change_column :requests, :total_price, :integer
    change_column :request_items, :final_price, :integer
    change_column :request_items, :purch_cost, :integer
    change_column :request_items, :acct_price, :integer
  end
end
