get '/users/new' do 
 erb :users_new
end

post '/users' do
  if params[:password] == params[:password2] 
    @user = User.new( :name => params[:name], 
                      :email => params[:email])
    @user.password = params[:password]
    if @user.save
      session[:user_id] = @user.id
      redirect to('/posts')
    end
  else
    erb :users_new
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :users_show
end

get '/users/:id/posts' do
  @posts = User.find(params[:id]).posts
  erb :user_posts
end

get '/users/:id/comments' do
  @comments = User.find(params[:id]).comments
  erb :user_comments
end
