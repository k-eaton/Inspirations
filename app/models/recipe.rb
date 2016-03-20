class Recipe < ActiveRecord::Base
  serialize :ingredients, Array
  serialize :images, Array
end
