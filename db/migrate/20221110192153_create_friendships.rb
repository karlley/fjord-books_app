class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.references :follow_source, foreign_key: { to_table: :users }, null: false
      t.references :follow_target, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
    add_index :friendships, %i[follow_source_id follow_target_id], unique: true
  end
end
