require 'dotenv'
require 'mailgun'
require 'rest-client'
# require 'io/console'

module DailyEmail

	def email

		# recipes = Recipe.all

		# mg_client = Mailgun::Client.new(ENV['MAILGUN_API_KEY'])
		RestClient.post "https://api:key-6fd0c6ad67f99be9e606b80007f7cc69" \
		"@api.mailgun.net/v3/inspirations.guru",
	 #  data = {
		  :from 		=> "Excited User <YOU@inspirations.guru>",
		  :to 			=> "phrynne@gmail.com",
		#   # 'cc' 			=> "phrynne@gmail.com",
		#   # 'bcc' 		=> "phrynne@titan-project.org",
	  	:subject => "Hello",
		  :text 		=> "Testing some Mailgun awesomness!"
	 #  	# 'html' 		=> "<html>HTML version of the body</html>"
		# }


		# mg_client.send_message("https://api.mailgun.net/v3/inspirations.guru", data)
	  # data[:attachment] = File.new(File.join("files", "test.jpg"))
	  # data[:attachment] = File.new(File.join("files", "test.txt"))
	  # RestClient.post "https://api:"+ mailgun_api + "@api.mailgun.net/v3/inspirations.guru/messages", data
		# recipe_array
		# @recipe_of_the_day = Recipe.find_by(id: 1)
		# template = File.open("/Users/katrinaeaton/Desktop/Nerding/Projects/Inspirations/Inspirations/public/template.txt")

	end
end