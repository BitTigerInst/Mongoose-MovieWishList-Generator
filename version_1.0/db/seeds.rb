# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Genre.delete_all
Genre.create!([
 {id: 1, name: "Action", genre_id: 28},
 {id: 2, name: "Adventure", genre_id: 12},
 {id: 3, name: "Animation", genre_id: 16},
 {id: 4, name: "Comedy", genre_id: 35},
 {id: 5, name: "Crime", genre_id: 80},
 {id: 6, name: "Documentary", genre_id: 99},
 {id: 7, name: "Drama", genre_id: 18},
 {id: 8, name: "Family", genre_id: 10751},
 {id: 9, name: "Fantasy", genre_id: 14},
 {id: 10, name: "Foreign", genre_id: 10769},
 {id: 11, name: "History", genre_id: 36},
 {id: 12, name: "Horror", genre_id: 27},
 {id: 13, name: "Music", genre_id: 10402},
 {id: 14, name: "Mystery", genre_id: 9648},
 {id: 15, name: "Romance", genre_id: 10749},
 {id: 16, name: "Science Fiction", genre_id: 878},
 {id: 17, name: "TV Movie", genre_id: 10770},
 {id: 18, name: "Thriller", genre_id: 53},
 {id: 19, name: "War", genre_id: 10752},
 {id: 20, name: "Western", genre_id: 37}
])