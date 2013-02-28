get '/posts/:post_id/comments/:comment_id/upvote' do
  content_type :json
  comment_vote = CommentVote.new(:comment_id => params[:comment_id],
                                 :user_id => session[:user_id])
  if comment_vote.save
    number_of_votes = CommentVote.where(:comment_id => params[:comment_id]).length
    {number_of_votes: number_of_votes, comment_id: params[:comment_id]}.to_json
  else
    erb :posts_show
  end
end

post '/posts/:post_id/comments' do
  content_type :json
  post = Post.find(params[:post_id])
  comment = Comment.new(:body => params[:body],
                        :post_id => params[:post_id],
                        :user_id => session[:user_id])
  if comment.save 
    comment.to_json 
  else
    render :posts_show
  end
end


