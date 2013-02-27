post '/posts/:post_id/comments' do
  post = Post.find(params[:post_id])
  comment = Comment.new(:body => params[:body],
                        :post_id => params[:post_id],
                        :user_id => session[:user_id])
  if comment.save 
    redirect to "/posts/#{post.id}"
  else
    render :posts_show
  end
end

get '/posts/:post_id/comments/:comment_id' do
end
