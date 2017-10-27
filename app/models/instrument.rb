class Instrument < ApplicationRecord
  has_many :musicianships
  has_many :musicians, through: :musicianships, source: :musician
  # Remember to create a migration!
end
