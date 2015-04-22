class CreateCapas < ActiveRecord::Migration
  def change
    create_table :capas do |t|
      t.string :capa_number
      t.string :pump_model
      t.string :item_number
      t.string :name
      t.date :date
      t.string :department
      t.text :description
      t.string :engineer
      t.text :quality_comments
      t.string :ncr
      t.text :engr_comments
      t.string :root
      t.string :cause
      t.string :suggested
      t.text :solution
      t.date :date_assigned
      t.date :date_resolved
      t.date :date_closed
      t.string :status
      t.text :follow_up_actions

      t.timestamps
    end
  end
end
