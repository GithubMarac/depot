# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Product.delete_all

Product.create!(title: 'Chatbot Interactions',
description: %{<p> this is a description</p>
<p>Another paragraph</p>},
image_url: 'http://power.itp.ac.cn/~jmyang/funny/fun4.jpg',
price: 20.00)