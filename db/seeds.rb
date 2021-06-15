require "csv"

# ROUTE SEEDING
# CSV.foreach(".csv") do |row|
#   Route.create(
#     name: row[0],
#     location: row[1],
#     mp_url: row[2],
#     grade: row[3],
#     lat: row[4],
#     lon: row[5],
#   )
# end

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

Collection.create(
  name: "Rifle",
  partners: "Mariah, Dylan, Dillon, Will, Beth, Kathleen, Mark",
  highlights: "Rifle was freaking awesome. Climbing summer camp for adults is a very fitting name. So much fun to walk between crags and the vibe was just fantastic. To top it off, every route I tried was unique and SO FUN. Can't wait to get back for Ricochet, Family Jewels and Baby Jesus",
  user_id: 1,
)
