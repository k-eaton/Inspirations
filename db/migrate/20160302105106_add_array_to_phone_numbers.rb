class AddArrayToPhoneNumbers < ActiveRecord::Migration
  def change
  	change_table :phone_numbers do |t|
  		t.text :quote_array
  	end
  end
end
