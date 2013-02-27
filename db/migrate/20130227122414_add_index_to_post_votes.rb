class AddIndexToPostVotes < ActiveRecord::Migration
  def change
    add_index :post_votes, [:post_id, :user_id], :unique => true
  end
end
