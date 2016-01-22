class PhoneNumber < ActiveRecord::Base
  # Remember to create a migration!
  validates :number, presence: true, uniqueness: true
  validates_format_of :number, with: /\A\d{3}-\d{3}-\d{4}\z/, on: :create
end
