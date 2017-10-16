class MusiciansInstruments < ApplicationRecord
  belongs_to :musician
  belongs_to :instrument
  # Remember to create a migration!
end
