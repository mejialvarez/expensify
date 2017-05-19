['Rental', 'Restaurant', 'Supermarket', 'Public services', 'Transport'].each do |category_name|
  category = Category.create!(name: category_name)
  puts "Category #{category.id} created"
end