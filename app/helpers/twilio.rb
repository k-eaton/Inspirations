
require 'dotenv'
require 'twilio-ruby'


module Twilio
	def self.text()#phone_numbers, quote)
		# put your own credentials here 
		account_sid = ENV['ACCOUNT_SID'] 
		auth_token = ENV['AUTH_TOKEN'] 

		client = Twilio::REST::Client.new account_sid, auth_token
		 
		from = "+13104218914" # Your Twilio number
		 
		quote = "Kanye Loves You"

		phone_numbers = [
		"+19256396135"
		# "+14155557775",
		# "+14155551234"
		]
		phone_numbers.each do |number|
		  client.account.messages.create(
		    :from => from,
		    :to => number,
		    :body => quote
		  )
		  puts "Sent message to #{number}"
		end
	end
end