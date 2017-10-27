get '/musicians/new' do
  erb :'musicians/new'
end

post '/musicians' do
  @musician = Musician.new(params[:musician])
    if @musician.save
      session[:id] = @musician.id
      redirect "/musicians/#{@musician.id}"
    else
      @errors = @musician.errors.full_messages
      erb :'musicians/new'
    end
end

get '/musicians/:id' do
  @musician = Musician.find(params[:id])
  erb :'musicians/show'
end
