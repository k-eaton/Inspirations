require 'dotenv'
require 'twilio-ruby'

set :show_exceptions, false

# enable :sessions

# use Rack::Session::Cookie, :key => 'rack.session',
#                            # :domain => 'foo.com',
#                            :path => '/',
#                            :expire_after => 2592000, # In seconds
#                            :secret => ENV['SECRET'] ||= 'super secret'
 
use Rack::Session::Pool

get '/' do

	quotes = Quote.all
	quote_id1 = rand(quotes.length)
	@quote1 = Quote.find_by(id: quote_id1)
	quote_id2 = rand(quotes.length)
	@quote2 = Quote.find_by(id: quote_id2)

	puts("*** / end")

	erb :index
end

post '/signup' do

	puts("*** /post signup start")
	
	# Set session
	session[:number] = params[:phone].to_s
	@number = PhoneNumber.find_by number:(session[:number])

	# Pick a quote
	quotes = Quote.all
	quote_id = rand(quotes.length)
	quote = Quote.find_by(id: quote_id)

	# If number is new, add it to the database
	if @number == nil || @number.number == "f"
		PhoneNumber.create(number: session[:number])
		text(session[:number], "Welcome to Inspirations!")
		text(session[:number], quote.quote)
	end

	puts("*** /post signup end")

	redirect '/settings'

end

get '/settings' do

	puts("*** get/settings start")
	puts(session[:number])

	# Continue session
	@number = PhoneNumber.find_by number:(session[:number])

	# Identify if user is subscribed or not
	if @number != nil	# session[:id] = @number.id
		@subscribed = @number.subscribed
		puts(@number.subscribed)
		puts("*** get/settings end")
	else

	# Error handling
		"Phone number does not exist"
	end

	erb :settings

end

post '/settings' do

	puts("*** post/settings start")

	# Continue session
	@number = PhoneNumber.find_by number:(session[:number])
	@number.subscribed = params[:subscription]
	@number.save

	# Toggle subscription
	if params[:subscription] == true.to_s		
		text(session[:number], "Subscribed to Inspirations")
	else
		text(session[:number], "Unsubscribed from Inspirations")
	end

	puts("text sent?")
	puts(@number.subscribed)

	@subscribed = params[:subscription]
	puts(@subscribed)

	puts("post/settings end")

	redirect '/settings'

end

post '/delete' do

	# Continue Session
	@number = PhoneNumber.find_by number:(session[:number])

	# Delete the number
	puts("params[:delete] = " + params[:delete])
	if params[:delete] == "on"
		text(session[:number], "Your number has been deleted from the database")
		@number.destroy
		session.clear           
	end
	redirect '/'
end

get '/backend' do
	@numbers = PhoneNumber.all

	erb :backend
end

get '/sms' do
	# incoming = Twilio::TwiML::Response.new do |r|
	# 	if r.upcase == "START" || r.upcase == "SUBSCRIBE"
	# 		r.Message "You have subscribed to Inspirations"
	# 	end
	# incoming.text



  # twiml = Twilio::TwiML::Response.new do |r|
  #   r.Message "Hey Monkey. Thanks for the message!"
  # end
  # twiml.text
end

# error do
# 	"You must enter a phone number."
# 	redirect '/'
# end
