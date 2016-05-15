['Arriendo', 'Restaurante', 'Supermercado', 'Servicios publicos', 'Transporte'].each do |category_name|
  category = Category.create!(name: category_name)
  puts "Category #{category.id} created"
end
