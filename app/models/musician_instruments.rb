class MusicianInstrument < ApplicationRecord
  belongs_to :musician
  belongs_to :instrument

  def self.exists?(instrument, musician)
    return true if self.find_by(instrument: instrument, musician: musician)
    false
  end

end
