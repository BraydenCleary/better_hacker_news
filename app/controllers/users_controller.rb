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


