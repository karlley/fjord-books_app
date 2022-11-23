class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.integer :follow_source_id, null: false
      t.integer :follow_target_id, null: false

      t.timestamps
    end
    add_index :friendships, :follow_source_id
    add_index :friendships, :follow_target_id
    add_index :friendships, %i[follow_source_id follow_target_id], unique: true
  end
end
