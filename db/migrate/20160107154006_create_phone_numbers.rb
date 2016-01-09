class CreatePhoneNumbers < ActiveRecord::Migration
  def change
  	create_table :phone_numbers do |t|
  		t.text :number
      t.boolean :subscribed
      t.integer :q_count, :null => false, :default => 1

      t.timestamps null: false
    end
  end
end
