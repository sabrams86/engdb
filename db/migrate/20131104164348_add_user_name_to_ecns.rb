class AddUserNameToEcns < ActiveRecord::Migration
  def change
    add_column :ecns, :user_name, :string

  end
end
