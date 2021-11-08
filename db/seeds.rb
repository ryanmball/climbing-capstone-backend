require "csv"

# ROUTE SEEDING
CSV.foreach("route_seed_file_9.csv") do |row|
  Route.create(
    name: row[0],
    location: row[1],
    mp_url: row[2],
    grade: row[3],
    lat: row[4],
    lon: row[5],
    crag: row[6],
    area: row[7],
  )
end

# RECORD SEEDING
# CSV.foreach(".csv") do |row|
#   Record.create(
#     date: row[0],
#     route_id: row[1],
#     grade: row[2],
#     result: row[3],
#     in_progress: row[4],
#     rating: row[5],
#     partner: row[6],
#     comments: row[7],
#     collection_id: row[8],
#     user_id: row[9],
#   )
# end

# Collection.create(
#   name: "",
#   partners: "",
#   highlights: "",
#   user_id: 0,
# )

# Route.create(
#   name: "Boulder Quartz System",
#   location: "Right Side > Plotinus Wall > Lower Dream Canyon > Boulder Canyon > Boulder > Colorado",
#   mp_url: "https://www.mountainproject.com/route/105755836/boulder-quartz-system",
#   grade: "5.12a",
#   lat: 40.00683,
#   lon: -105.40619,
#   crag: "Right Side",
#   area: "Plotinus Wall"
# )