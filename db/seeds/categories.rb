['Arriendo', 'Restaurante', 'Supermercado', 'Servicios público', 'Transporte'].each do |category_name|
  category = Category.create!(name: category_name)
  puts "Category #{category.id} created"
end