# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def info(resource)
  puts "Seeding #{resource}"
end

categories = [
  {:name => 'Art, Design and Photography', :grouping => 'Everyday'},
  {:name => 'Style and Fashion', :grouping => 'Everyday'},
  {:name => 'Music, Books and TV', :grouping => 'Everyday'},
  {:name => 'Places and Travel', :grouping => 'Everyday'},
  {:name => 'Relationships', :grouping => 'Everyday'},
  {:name => 'Sports', :grouping => 'Everyday'},
  {:name => 'Hobbies', :grouping => 'Everyday'},
  
  {:name => 'Humour', :grouping => 'Fun'},
  {:name => 'Random', :grouping => 'Fun'},
  {:name => 'NSFW', :grouping => 'Fun'},

  {:name => 'Politics', :grouping => 'Serious'},
  {:name => 'Science and Technology', :grouping => 'Serious'},
  {:name => 'Education and Career', :grouping => 'Serious'},
  {:name => 'Business and Finance', :grouping => 'Serious'},
  {:name => 'Books and Literature', :grouping => 'Serious'},

  {:name => 'Event', :grouping => 'live'}
]

info "categories"
categories.each do | c |
  Category.find_or_create_by(c)
end