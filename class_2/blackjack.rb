# Fix a nice drink
# Keep game going!
# I need cards
cards_in_hand = []
@gameon = true

def get_card
	rand(1..11)
end

def check_win(cards)  # parameters is anything passed inside a function
	if cards > 21
		@gameon = false
		puts "BUST"
	elsif cards == 21
		@gameon = false
		puts "I WIN"
	elsif cards < 21
		puts "WHAT ARE YOU DOING?"
	end
end

# Dealer needs to give me two cards
cards_in_hand.push(get_card)
cards_in_hand.push(get_card)

while @gameon == true
	card_values = 0
	puts "You have the following cards: "
	cards_in_hand.each do |card|
		puts card
		card_values += card
	end
	puts "Card values: #{card_values}"
	puts "Do you want to hit or stay (h to hit, s to stay)?"
	hit_or_stay = gets.chomp
	if hit_or_stay == 'h'
		new_card = get_card
		cards_in_hand.push(new_card)
		puts "This is your new card #{new_card}"
		card_values += new_card
		puts "Your total is now: #{card_values} "
		check_win(card_values)
	end

	if hit_or_stay == 's'
		check_win(card_values)
		@gameon = false
	end
end






#   dealer deals himself cards
#   if dealer is < 17
#    he gets more cards
#    once dealer is >= 17
#   check to see whos card value is higher.
#   end

