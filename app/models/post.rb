class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_votes

  def user_voted?(current_user_id)
    self.post_votes.map {|post_vote| post_vote.user_id}.include?(current_user_id)
  end

end
