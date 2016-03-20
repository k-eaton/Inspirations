class CreateEmails < ActiveRecord::Migration
  def change
  	create_table :emails do |t|
  		t.text :title

      t.timestamps null: false
    end
  end
end
