class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :request_number
      t.string :requester
      t.string :regional_sales_mgr
      t.string :rep
      t.string :quote_number
      t.string :order_number
      t.string :customer
      t.string :cusomter_location
      t.string :product_line
      t.date :inq_submitted_date
      t.date :order_submitted_date
      t.string :rev_level
      t.text :description
      t.string :status
      t.text :comments

      t.timestamps
    end
  end
end
