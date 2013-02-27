get '/' do
  redirect to('/posts')
end

get '/posts' do
  @posts = Post.all.sort { |a,b| b.post_votes.length <=> a.post_votes.length}
  erb :posts
end

get '/posts/new' do 
  erb :posts_new
end

post '/posts' do
  post = Post.new(:title => params[:title],
                  :link => params[:link] )
  if post.save
    redirect to '/posts'
  else
    erb :posts_new
  end  
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @comments = @post.comments
  erb :posts_show
end

get '/posts/:id/upvote' do 
  post_vote = PostVote.new(:post_id => params[:id],
                           :user_id => session[:user_id])
  if post_vote.save
    redirect to '/posts'
  else
    erb :posts
  end
end