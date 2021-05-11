require "http"



response = HTTP.get ("http://localhost:3000/products")

products = response.parse

puts "welcome to Ben's ship store!"

