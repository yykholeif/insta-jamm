class EventMusicians < ApplicationRecord
  belongs_to :event
  belongs_to :musician
  # Remember to create a migration!
end
