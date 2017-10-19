class Musician < ApplicationRecord
  has_many :musicians_instruments
  has_many :instruments, through: :musicians_instruments
  # Remember to create a migration!
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    @musician = self.find_by(email: email)
    if @musician && @musician.password == password
      return @musician
    else
      nil
    end
  end


  def convert_to_longitude_latitude
    #add longitude latitude columns into event and musician table and remove city,postcode from table
  end


end
