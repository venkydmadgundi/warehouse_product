# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Creating 60 products with count
(1..60).each { |i| product = Product.create!(sku_code: 10000000 + i, name: "Product #{i}", price: (rand * 100).round(2)) }

# Creating warehouses for Mumbai
# PRODUCT_THRESHOLD = 10 is defined in initializers/constants.rb
mumbai = Warehouse.create!(wh_code: 'mumbai', name: 'Mumbai', pincode: '400001', max_capacity: 1000)
mumbai.generate_warehouses_products(Product.all)

# Creating warehouses for Banglore
bangalore = Warehouse.create!(wh_code: 'bangalore', name: 'Bangalore', pincode: '560001', max_capacity: 10000)
# Banglore warehouse one third products below threshold
banglore_groups = Product.all.in_groups(3)
bangalore.generate_warehouses_products(banglore_groups[0], true )
bangalore.generate_warehouses_products(banglore_groups[1]+banglore_groups[2])


# Creating warehouses and their products for Delhi
delhi = Warehouse.create!(wh_code: 'new_delhi', name: 'New Delhi', pincode: '110001', max_capacity: 10000)
# Delhi warehouse one third products below threshold
delhi_groups = Product.all.in_groups(2)
delhi.generate_warehouses_products(delhi_groups[0], true )
delhi.generate_warehouses_products(delhi_groups[1] )

# product = Product.create!(sku_code: 10000000 + 100, name: "Product #{100}", price: (rand * 100).round(2))
# pune = Warehouse.create!(wh_code: 'pune', name: 'pune', pincode: '412001', max_capacity: 1000)
# ProductWarehouse.create!(product: product, warehouse: pune)
