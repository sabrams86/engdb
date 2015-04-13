class CreateTreqFiles < ActiveRecord::Migration
  def change
    create_table :treq_files do |t|
      t.integer :treq_id
      t.string :file

      t.timestamps
    end
  end
end
