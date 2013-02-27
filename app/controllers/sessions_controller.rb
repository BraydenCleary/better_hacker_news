get '/logout' do
  session.delete(:user_id)
  redirect to('/posts')
end

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  user = User.find_by_email(params[:email])
  if user.password == params[:password]
    session[:user_id] = user.id
    redirect to '/posts'
  else
   erb :sign_in  
  end
end
