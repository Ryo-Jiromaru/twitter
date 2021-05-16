class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :body
      t.integer :user_id
      t.string :title

      t.string :address
      t.float :latitude
      t.float :longitude
      
      t.timestamps
    end
  end
end
