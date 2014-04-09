puts "let me get your bmi"
puts "enter your weight"
user_weight = gets.to_f
puts"enter your height"
user_height = gets.chomp.to_f
bmi = (user_weight/user_height**2)*703
puts "your bmi is #{bmi}"