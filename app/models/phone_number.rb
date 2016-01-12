class PhoneNumber < ActiveRecord::Base
  # Remember to create a migration!
  validates :number, presence: true, uniqueness: true
end
