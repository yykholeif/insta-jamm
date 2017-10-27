class Musician < ApplicationRecord
  has_many :musicians_instruments
  has_many :instruments, through: :musicians_instruments
  # Remember to create a migration!
  include BCrypt

  after_validation :convert_to_longitude_latitude

  validates :email, :password, presence: true
  validates :email, uniqueness: true

  def password
     @password ||= Password.new(password_hash)
   end

   def password=(new_password)
     @password = Password.create(new_password)
     self.password_hash = @password
   end

   def self.authenticate(username, password)
     @musician = User.find_by(username: username)
     if @musician && @musician.password == password
       @musician
     else
       nil
     end
   end

  def full_address
    "#{self.street_address}, #{self.city}, #{self.state} #{self.postcode}"
  end

  private

  def convert_to_longitude_latitude
    coordinates = GooglePlacesAdapter.convert_address(self.full_address) # a hash with two keys: lat and lng
    self.latitude = coordinates["lat"]
    self.longitude = coordinates["lng"]
    #add longitude latitude columns into event and musician table and remove city,postcode from table
  end

end
#Google place API research
