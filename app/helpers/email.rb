require 'pony'
require 'io/console'

module DailyEmail

	def email

		recipes = Recipe.all
		# recipe_array
		@recipe_of_the_day = Recipe.find_by(id: 1)
		template = File.open("/Users/katrinaeaton/Desktop/Nerding/Projects/Inspirations/Inspirations/public/template.txt")

		Pony.mail(:to => 'phrynne@gmail.com', 
							:from => 'phrynne@titan-project.org', 
							:subject => @recipe_of_the_day.title, 
							:body => template
							)

	end
end