post '/musicianships' do
  p params
  @musician = current_user
  @instrument = Instrument.find_by(id: params[:instrument_id])
  p @instrument
  if Musicianship.exists?(@instrument, current_user)
    p "x" * 100
    @errors = ["You already registered that you play this instrument"]
    redirect "/musicians/#{@musician.id}"
  else
    p "*" * 100
    Musicianship.find_or_create_by(musician: current_user, instrument: @instrument)
    redirect "/musicians/#{@musician.id}"
  end
end
