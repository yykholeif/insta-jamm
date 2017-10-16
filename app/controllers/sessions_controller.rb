get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    login(@user)
    redirect "/users/#{@user.id}"
  else
    @errors = ['Invalid username or password']
    erb :'sessions/new'
  end
end

delete '/sessions' do
  logout
  redirect '/'
end
