helpers do 

  def user_voted?
    self.post_votes.map {|post_vote| post_vote.user_id}.include?(session[:user_id])
  end

end
