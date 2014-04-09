hash = {
	students: [
		{
			first_name: "Brian",
			last_name: "Boyd"
		},
		{
			first_name: "Kevin",
			last_name: "Collins"
		}
	],
	# teachers: [
	# 	{
	# 		first_name: "Nick",
	# 		last_name: "Bucciarelli"
	# 	},
	# 	{
	# 		first_name: "Calvin",
	# 		last_name: "Webster"
	# 	}
	# ],
	company: "The Iron Yard",
# 	founded: 1900
# }
hash[:students]
hash[:students][0]
hash[:students][0][:first_name]
# a = :hello # <--- Symbol

hash.each do |key|
	puts key
end
