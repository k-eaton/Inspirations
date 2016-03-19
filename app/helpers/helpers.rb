
require 'dotenv'
require 'twilio-ruby'
require 'mail'

helpers do
# module Twilio
	def text(phone_number, quote)
		# put your own credentials here 
		account_sid = ENV['ACCOUNT_SID'] 
		auth_token = ENV['AUTH_TOKEN'] 

		client = Twilio::REST::Client.new account_sid, auth_token
		 
		from = "+13104218914" # Your Twilio number
		 
		# quote = "Kanye Loves You"

		# phone_numbers = [
		# "+19256396135"
		# # "+14155557775",
		# # "+14155551234"
		# ]
		# phone_numbers.each do |number|
		  client.account.messages.create(
		    :from => from,
		    :to => phone_number,
		    :body => quote
		  )
		  puts "Sent message to #{phone_number}"
		# end
	end

	def email()




	end
end