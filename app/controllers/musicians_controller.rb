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

get '/musicians/locations' do
  @musicians = Musician.all
  musicians_arr = []
  @musicians.each do |musician|
    musicians_arr << [musician.email, musician.latitude, musician.longitude]
  end
  content_type :json
  musicians_arr.to_json
end

get '/musicians/:id' do
  @musician = Musician.find(params[:id])
  erb :'musicians/show'
end
