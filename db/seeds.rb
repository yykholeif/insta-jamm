Instrument.destroy_all

instruments = %w(Piano Guitar Trumpet Drums Violin Bass-Guitar Saxophone Ukelele Flute)

instruments.each do |instrument_name|
  Instrument.create!(name: instrument_name)
end
