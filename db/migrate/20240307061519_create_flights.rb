class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.string :source_city
      t.string :destination_city
      t.string :flight_number
      t.string :airline_name
      t.datetime :departure_time
      t.datetime :arrival_time
      t.string :duration
      t.integer :num_stops
      t.decimal :price

      t.timestamps
    end
  end
end
