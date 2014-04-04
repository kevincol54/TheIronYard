puts "get ready to lose"
@game_on = true
@word = ["free" , "winner" , "chicken" , "boat" , "ducks"]
random_number = rand(1..5)

@random_word = @word[random_number]


@guesses = 0


def guesses 
	case guess
	when 4
		@guesses = 7
	puts	"7 tries little man"
	when 5
		@guesses = 8
	puts	"8 is all you get"
	when 6
		@guesses = 9
	puts	"9 is quite a few guesses"
	when 7
		@guesses = 10
	puts	"10 makes it really easy to guess right"
	end
end





# guess_count(random_word.length)

alphabet = [*'a'..'z']
puts "give it your best shot"


guessed_letters = []
guessed_letter = gets.chomp
guessed_letters.push(guessed_letter)
puts "unguessed letters: #{alphabet.join(' ')}"
alphabet.delete(guessed_letters)
puts "guessed letters: #{guessed_letters.join(' ')}"

def scans (scan)
    # write code to scan the word and find the matching letters
	if scans(guessed_letter) == true
	 puts "thats one right"
	else puts "not so lucky jack"
end

# Call the scan method
@random_word.scans(guessed_letter)

@random_word.index(guessed_letters)


	


# test = Array.new(@random_word.length)
# @random_word.split("")









# random_word. {(guessed_letter)}

#"apple".split("") will be ["a","p","p","l","e"]
#test = [nil, nil, nil, nil, nil]
# ["a","p","p","l","e"] each_with_index do |letter, index|
# if guessed_letter == letter
# 	test[index] = guessed_letter

#test = array.new(random_word.length)

































