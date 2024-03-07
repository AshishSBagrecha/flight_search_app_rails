Flight.destroy_all
cities = [
      "Mumbai", "Delhi", "Bangalore", "Hyderabad", "Chennai",
      "Kolkata", "Pune", "Ahmedabad", "Jaipur", "Lucknow",
      "Kanpur", "Nagpur", "Visakhapatnam", "Indore", "Thane",
      "Bhopal", "Patna", "Vadodara", "Ghaziabad", "Ludhiana"
    ];
500.times do
    source_city = cities.sample
    destination_city = (cities - [source_city]).sample
    Flight.create!(
      flight_number: Faker::Alphanumeric.alphanumeric(number: 6).upcase, # Example: ABC123
      airline_name: Faker::Company.name,
      departure_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30.days),
      arrival_time: Faker::Time.forward(days: 1, period: :morning),
      duration: "#{rand(1..10)}h #{rand(0..59)}m",
      num_stops: rand(0..3),
      price: rand(100.0..1000.0).round(2),
      source_city: source_city,
      destination_city: destination_city
    )
  end
