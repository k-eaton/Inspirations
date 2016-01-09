class Quote < ActiveRecord::Base
  # Remember to create a migration!
  validates :quote, presence: true
end
