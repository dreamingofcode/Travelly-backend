class CreateUserTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :user_trips do |t|
      t.string :tripName
      t.string :tripDestination
      t.string :tripStart
      t.string :tripEnd
      t.string :flight
      t.string :hotel
      t.string :todo
      t.integer :user_id
      

      t.timestamps
    end
  end
end
