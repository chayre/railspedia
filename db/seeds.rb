# Seed our database with the 10 airports in the US
airports = Airport.create([
{ airport_id: 'IAD' },
{ airport_id: 'ATL' },
{ airport_id: 'DFW' },
{ airport_id: 'DEN' },
{ airport_id: 'ORD' },
{ airport_id: 'LAX' },
{ airport_id: 'CLT' },
{ airport_id: 'LAS' },
{ airport_id: 'PHX' },
{ airport_id: 'JFK' }
])

# We'll map the 10 airports to a number (1 - 10)
# Product will do all the permutations, we'll convert that to an array of combos
# However, this contains duplicate combos (for example, [7, 7]) so we remove those with reject
flights_constructor = (1..10).to_a.product((1..10).to_a).reject { |combo| combo[0] == combo[1] }
# flights_constructor contains every airport combo ([LAX, CLT], [PHX, MCO] ...); iterate through each combo
flights_constructor.each do |flight_combo|
  # Make 70 to 80 random flights for each airport combo
  rand(70..80).times do
    # Flight duration is randomized; departure time also randomized to one month from now and converted to datetime 
    Flight.create(
      departure_airport_id: flight_combo[0],
      arrival_airport_id: flight_combo[1],
      flight_duration: "#{rand(1..4)} hr #{rand(0..59)} min",
      departure_time: rand(1.months).seconds.from_now.to_datetime)
  end
end
