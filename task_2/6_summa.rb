products = {}
total_result = 0

loop do
  print 'Введите наименование товара: '
  product_name = gets.chomp
  break if product_name == 'stop'
  print 'Введите цену: '
  price = gets.to_f
  print 'Введите колличество: '
  number = gets.to_f
  products[product_name] = { number: number, price: price }
end

products.each do |product, attrs|
  number = attrs[:number]
  price = attrs[:price]
  total_price = number * price
  puts "Product: #{product}, number: #{number}, price: #{price},"\
       "total price: #{total_price}"
  total_result += total_price
end
puts "Общая цена товара: #{total_result}"