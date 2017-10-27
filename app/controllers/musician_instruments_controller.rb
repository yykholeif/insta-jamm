post '/musician_instruments' do
  @user = current_user
  @instrument = Instrument.find_by(params[:instrument_id])
  if MusicianInstruments.exists?(@instrument, current_user)
    @errors = ["You already registered that you play this instrument"]
    erb :'musicians/show'
  else
    @user.musician_instruments.create(instrument: @instrument)
    redirect "/musicians/#{@user.id}"
  end
end
