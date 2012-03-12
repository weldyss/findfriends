class CreateFriendship < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.string :user_id, null: false
      t.string :friend_id, null: false
    end
  end
end
