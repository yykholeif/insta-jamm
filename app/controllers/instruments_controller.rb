post '/instruments' do
  @instrument = Instrument.new(params[:instrument])
    if @instrument.save
      session[:id] = current_user.id
      @instrument.musicians = current_user.id
      redirect "/musicians/#{@musician.id}"
    else
      @errors = @musician.errors.full_messages
      erb :'musicians/new'
    end
end
