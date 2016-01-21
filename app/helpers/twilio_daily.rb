require 'dotenv'
require 'twilio-ruby'

module Twilio

	def text
		# put your own credentials here 
		account_sid = ENV['ACCOUNT_SID'] 
		auth_token = ENV['AUTH_TOKEN'] 

		client = Twilio::REST::Client.new account_sid, auth_token
		 
		from = "+13104218914" # Your Twilio number
		 
		quotes = Quote.all
		quote_id = random(0, quotes.length)
		quote = Quote.find_by(id: quote_id)

		phone_numbers = PhoneNumber.all

		phone_numbers.each do |number|
		  client.account.messages.create(
		    :from => from,
		    :to => number,
		    :body => quote
		  )
		  puts "Sent message to #{phone_number}"
		end
	end

end