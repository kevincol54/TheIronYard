# What I'd like you to do is ask the user to enter names over 
# and over again until they type in "q". 
# As they are hitting enter, 
# the names should be pushing on to an array. 
# After they type "q" display every single name using a loop.

puts " please enter names, hit enter after each one"
puts "if you hit 'q', ill display all the names"
name = gets.chomp
names = [""]
names.push(name)
while name.gets.chomp
end



