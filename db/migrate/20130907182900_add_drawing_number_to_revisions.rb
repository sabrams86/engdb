class AddDrawingNumberToRevisions < ActiveRecord::Migration
  def change
    add_column :revisions, :drawing_number, :string

  end
end
