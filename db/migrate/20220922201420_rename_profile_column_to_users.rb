class RenameProfileColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :profile, :self_introduction
  end
end
