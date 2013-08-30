class AddEcnIdToRevisions < ActiveRecord::Migration
  def change
    add_column :revisions, :ecn_id, :integer

  end
end
