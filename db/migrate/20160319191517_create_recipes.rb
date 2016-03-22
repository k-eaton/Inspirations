class CreateRecipes < ActiveRecord::Migration
  def change
  	create_table :recipes do |t|
  		t.text :title
  		t.text :subtitle
  		t.text :ingredients
  		t.text :instructions
  		t.text :image

      t.timestamps null: false
    end
  end
end
