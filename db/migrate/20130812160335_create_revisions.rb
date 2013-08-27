class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.text :change
      t.text :justification
      t.string :rev_level
      t.string :disposition_wip
      t.string :disposition_inventory
      t.integer :quantity_in_qantel

      t.timestamps
    end
  end
end
