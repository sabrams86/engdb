class CreateEngineeringProjects < ActiveRecord::Migration
  def change
    create_table :engineering_projects do |t|
      t.integer :project_number
      t.date :created_on
      t.string :project_engineer
      t.string :title
      t.text :description
      t.string :status
      t.string :file_location

      t.timestamps
    end
  end
end
