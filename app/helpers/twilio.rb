require 'dotenv'
require 'twilio-ruby'

module DailyText

	def text
		# put your own credentials here 
		account_sid = ENV['ACCOUNT_SID'] 
		auth_token = ENV['AUTH_TOKEN'] 

		client = Twilio::REST::Client.new account_sid, auth_token
		 
		from = "+13104218914" # Your Twilio number
		 
		quotes = Quote.all
		quote_id = rand(quotes.length)
		puts(quote_id)

		quote = Quote.find_by(id: quote_id)

		phone_numbers = PhoneNumber.all
		phone_numbers.each do |number|
			begin
			  client.account.messages.create(
			    :from => from,
			    :to => number.number,
			    :body => quote.quote
			  )
			  puts "Sent message to #{number.number}"
			  puts "#{quote.quote}"
			rescue Twilio::REST::RequestError => e
				puts e.message
			end
		end
	end
end