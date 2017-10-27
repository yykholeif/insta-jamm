Instrument.destroy_all

instruments = %w(Piano Guitar Trumpet Drums Violin Bass-Guitar Saxophone Ukelele Flute)

instruments.each do |instrument_name|
  Instrument.create!(name: instrument_name)
end

user_details = {
  first_name: "Roger",
  last_name: "Li",
  email: "roger@roger.com",
  street_address: "633 Folsom St",
  city: "SF",
  state: "CA",
  country: "USA",
  postcode: "94124",
  years_experience: 3
}

musician = Musician.new(user_details)
musician.password = "123"
musician.save
