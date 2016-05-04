m = 100
array = [1,1]

i=2
until i > m
	array << array[i-1] + array[i-2]
	i+=1
end
while array.length <=100
	array << array[-1] + array [-2]
end
puts array