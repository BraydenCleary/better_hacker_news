class Comment < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :post
  has_many    :comment_votes

  def user_voted?(current_user_id)
    self.comment_votes.map {|comment_vote| comment_vote.user_id}.include?(current_user_id)
  end

end
