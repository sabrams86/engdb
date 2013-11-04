class AddCommentsToEcns < ActiveRecord::Migration
  def change
    add_column :ecns, :comments, :text

  end
end
