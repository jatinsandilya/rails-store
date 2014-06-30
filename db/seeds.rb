# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
5.times do 
  products = Product.create(title: 'eloquent-ruby',description: 'random text',image_url:'er',price:0.00)
end