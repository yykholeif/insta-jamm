class Instrument < ApplicationRecord
  has_many :musicians_instruments
  has_many :musicians, through: :musicians_instruments
  # Remember to create a migration!
end
