get '/sessions/new' do
  @musician = Musician.new

  if request.xhr?
    erb :'sessions/_new', layout: false, locals: {musician: @musician}
  else
    erb :'sessions/new'
  end
end

post '/sessions' do
  @musician = Musician.find_by(email: params[:email])

  if @musician && @musician.password == params[:password]
    session[:id] = @musician.id
    redirect "/musicians/#{@musician.id}"
  else
    @error = 'Email or password invalid'
    erb :"sessions/new"
  end
end

delete '/sessions' do
  session[:id] = nil
  redirect '/'
end
