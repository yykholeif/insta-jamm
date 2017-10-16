class Subscription < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  # Remember to create a migration!
end
