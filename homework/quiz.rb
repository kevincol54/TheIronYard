puts "WELCOME TO TESTTTTT"

right_answers = []


questions = [
    {
	question: "why did the cow moo?",
	answer: "a",
	answer_choices:[
	"A. because it felt like it",
	"B. because its a cow",
	"C. had nothing to do"]
},
{   question: "who at the pie?",
    answer: "b",
    answer_choices:[
    	"A. the duck",
    	"B. the goose",
    	"C. birds hate pie"]
},
{    question: "why did i take this class?",
     answer: "c",
     answer_choices: [
     	"A. make boats of moola",
     	"B. build awesome open source programs that change the world for the better",
     	"C. i had an extra 10k laying around"]
},
{
	question: "who has more money?",
	answer: "b", 
	answer_choices:[
		"A. OBAMAAAAAA",
		"B. calvin and hobbs",
		"C. my little sister"]
},
{ 
	question: "where are my pants?",
    answer: "c", 
    answer_choices:[
    	"A. on me?",
    	"B. i own pants?",
    	"C. pants are overrated!"]
},
{
	question: "Im Ron...",
	answer: "c",
	answer_choices:[
		"A. Swanson.",
		"B. Howard.",
		"C. Burgundy?"]
},
{
	question: "Mr T was...",
	answer: "a", 
	answer_choices:[
		"A. a badazzzz!",
		"B. a dude with tons of bling",
		"C. my homeboy in the third grade"]
},
{
	question: "South Carolina needs...",
	answer: "b", 
	answer_choices:[
		"A. a NFL team",
		"B. a MLB team",
		"C. more churro stands"
	]
},
{
	question: "who are we?",
	answer: "c", 
	answer_choices:[
		"A. people",
		"B. animals",
		"C. all of the above"]
},
{
	question: "this class is...",
	answer: "d",
	answer_choices: [
		"A. fucking harddddd",
		"B. fucking awesommeee",
		"C. life changinggg",
		"D. all of the above!"]
}


]


questions.each do |question|
	puts question [:question]
puts question [:answer_choices]
puts "select an answer"
user_input = gets.chomp.downcase
    if user_input == question[:answer]
		puts "right"
	 right_answers.push	"right"
	elsif 
		puts "wrong"
	end



end
total_answers_right = right_answers.length
puts "Total Answers Right Out of 10"
puts total_answers_right




	
