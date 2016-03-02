require 'dotenv'
require 'twilio-ruby'

module DailyText

	def text
		# put your own credentials here 
		account_sid = ENV['ACCOUNT_SID'] 
		auth_token = ENV['AUTH_TOKEN'] 

		client = Twilio::REST::Client.new account_sid, auth_token
		 
		from = "+13104218914" # Your Twilio number

		phone_numbers = PhoneNumber.all
		quote_quotes = Quote.all
		phone_numbers.each do |number|
			
		###### Quotes ######
			# puts(number.quote_array)
			# puts(num_quotes)

			# Refill the quote_array if empty 
			if number.quote_array == []
				number.quote_array = (0...quote_quotes.length).to_a

				number.save
			end

			# Pick a random quote
			num_quotes = number.quote_array
			rand_quote = rand(num_quotes.length - 1)
			puts(rand_quote)
			quote_id = number.quote_array[rand_quote]
			number.quote_array.slice!(rand_quote)
			number.save

			# Final quote id
			quote = Quote.find_by(id: quote_id)

		###### Sending the texts ######
			
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