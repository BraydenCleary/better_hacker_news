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

get '/posts/:post_id/comments/:comment_id' do
end
