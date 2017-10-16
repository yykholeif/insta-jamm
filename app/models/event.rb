class Event < ApplicationRecord
  has_many :events_musicians
  has_many :musicians, through: :events_musicians
  # Remember to create a migration!
end
