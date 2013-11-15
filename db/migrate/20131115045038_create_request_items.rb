class CreateRequestItems < ActiveRecord::Migration
  def change
    create_table :request_items do |t|
      t.string :part_number
      t.string :item_number
      t.string :part_desc
      t.string :reference_part
      t.string :mfg_lead
      t.integer :mfg_labor
      t.integer :mfg_matl
      t.text :mfg_comments
      t.string :eng_lead
      t.integer :eng_hours
      t.string :make_from
      t.string :eng_status
      t.text :eng_comments
      t.integer :purch_cost
      t.integer :acct_price
      t.integer :final_price
      t.string :final_lead

      t.timestamps
    end
  end
end
