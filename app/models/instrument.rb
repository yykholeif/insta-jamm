class Instrument < ApplicationRecord
  has_many :musician_instruments
  has_many :musicians, through: :musician_instruments
  # Remember to create a migration!
end
