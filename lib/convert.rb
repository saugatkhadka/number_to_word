# Convert numbers to word

# Steps
# 1. Take a number as input. Expose a public function
# 2. Separate the last 10 numbers, or those with dashes
# 3. Generate the possible combinations from the number given
# 4. Match the word combinations with the library/dictionary
# 5. Create an array of the matching combinations of words and return them in an array


class Converter

  def initialize(phone_number)
  	@phone_number = phone_number
  	@digit_to_character = {
			"2": ["A", "B", "C"],
			"3": ["D", "E", "F"],
			"4": ["G", "H", "I"],
			"5": ["J", "K", "L"],
			"6": ["M", "N", "O"],
			"7": ["P", "Q", "R", "S"],
			"8": ["T", "U", "V"],
			"9": ["W", "X", "Y", "Z"]
  	}

  end

  def get_phone_number
  	# The phone numbers will never contain a 0 or 1. 

  	loop do
  		# If phone number is set when the class is initialized, do not run the 
			# input process	
  		break if @phone_number.strip.empty?

  		# Asking User Input
  		puts "Please enter a 10 digit phone number. "
	  # 	puts "(Should not contain digits : 1 or 0)"
	  # 	print "=> "
	  # 	phone_number = gets.chomp  # phone_number is a string input

	  # 	# Checking for the given condition: 0 or 1 present or less than 10
	  # 	if phone_number.include?("0") 
	  # 		puts "Phone number contains 0" 
	  # 		next
	  # 	elsif phone_number.include?("1") 
	  # 		puts "Phone number contains 1" 
	  # 		next
  	# 	elsif phone_number.strip.length < 10
			# 	puts "The phone number given is shorter than 10 digits! Please input the number again" 
			# 	next
			# else
			# 	@phone_number = phone_number
  	# 	end
  	end
  end

	
end	

convert = Converter.new(9860120521)
convert.get_phone_number