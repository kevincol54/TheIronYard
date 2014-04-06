cards_in_hand = []
dealer_cards_in_hand = []
@gameon = true

def get_card
	rand(1..11)
end

# def check_win(cards)  # parameters is anything passed inside a function
# 	if cards > 21
# 		@gameon = false
# 		puts "BUST"
# 	elsif cards == 21
# 		@gameon = false
# 		puts "I WIN"
# 	elsif cards < 21
# 		puts "L 7 WEENY"

# 	end
# end


# Dealer needs to give me two cards
cards_in_hand.push(get_card)
cards_in_hand.push(get_card)

while @gameon == true
	@user_values = 0
	puts "You have the following cards: "
	cards_in_hand.each do |card|
		puts card
		@user_values += card
	end
	puts "Card values: #{@user_values}"
	puts "Do you want to hit or stay (h to hit, s to stay)?"
	hit_or_stay = gets.chomp
		
	if hit_or_stay == 'h'
		new_card = get_card
		cards_in_hand.push(new_card)
		puts "This is your new card #{new_card}"
		@user_values += new_card
		puts "Your total is now: #{@user_values} "
	end

	if hit_or_stay == 's'
		#check_win(user_values)
		@gameon = false
	end	

	if @user_values > 21
		@gameon = false
	end	
end

@gameon = true

dealer_cards_in_hand.push(get_card)
dealer_cards_in_hand.push(get_card)

while @gameon == true
	@dealer_values = 0
	puts "Dealer has the following cards: "
	dealer_cards_in_hand.each do |card|
		puts card
		@dealer_values += card 
	end
	puts "Dealer has: #{@dealer_values}"
	if @dealer_values < 17
		new_card = get_card
		dealer_cards_in_hand.push(new_card)
		@dealer_values += new_card
	elsif @dealer_values >= 17
		@gameon = false
	end
	# @gameon = false
end
puts "Users has: #{@user_values}"
# puts "Dealers cards equal #{@dealer_values}"


if @user_values == 21
puts "win"
elsif @user_values > 21
puts "bust"
elsif @user_values > @dealer_values
puts "win"
elsif @dealer_values > @user_values
puts "loser"
elsif @user_values == @dealer_values
puts
"draw"
end


#check_win
#check to see who wins






#   dealer deals himself cards
#   if dealer is < 17
#    he gets more cards
#    once dealer is >= 17
#   check to see whos card value is higher.
#   end