class AddDrawingIdToRevisions < ActiveRecord::Migration
  def change
    add_column :revisions, :drawing_id, :integer

  end
end
