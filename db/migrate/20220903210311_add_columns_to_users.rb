class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :zipcode, :integer
    add_column :users, :address, :string
    add_column :users, :profile, :text
  end
end
