36.times do |number|
  Product.create(category_id: "#{number}")
end