class AddSubstitutionTypeToRequestItems < ActiveRecord::Migration
  def change
    add_column :request_items, :substitution_type, :string
  end
end
