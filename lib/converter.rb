class Converter

	# Initialize class
  def initialize

  	# Keypad Number to Word Mapping
  	@digit_to_character = {
			"2" => ["A", "B", "C"],
			"3" => ["D", "E", "F"],
			"4" => ["G", "H", "I"],
			"5" => ["J", "K", "L"],
			"6" => ["M", "N", "O"],
			"7" => ["P", "Q", "R", "S"],
			"8" => ["T", "U", "V"],
			"9" => ["W", "X", "Y", "Z"]
  	}

  	@phone_number = ""
  	@dictionary = []
  	@correct_words = []
  	@phone_keys = []
  	@phone_letters = []
  end

  # Main public method for entering phone number and returning an output
	def get_word_combinations(phone_number)
		@phone_number = phone_number

		# Stop execution if the phone number is not 10 digit or between 1 and 9
		validate_phone_number?(phone_number)
		
		load_dictionary
		get_letter_combinations

		return @correct_words.flatten(1)
	end


	# Private Class Methods
	private

	# Method to check if the phone number is between 1-9 and is 10 digit
	def validate_phone_number?(phone_number)
		unless (phone_number.length == 10 and phone_number.match(/^[2-9]*$/))
			raise "The given phone number is invalid. Please try again."
		end
	end

	# Method to load the dictionary file
	def load_dictionary
		# Strip each line of dictionary and pushes it into @dictionary
		File.open(Dir.pwd + '/data/dictionary.txt')
			.each { |line| @dictionary << line.strip }
	end

	# Method to convert each digit of the phone number to array of keypad letters
  def get_letter_combinations
  	number = @phone_number.split("")		# ["6","6","8","6"]

  	number.each do |digit|
  		@phone_letters << @digit_to_character[digit]
  	end

  	get_words
	end

	# Method to generate the combinations of letters in order
	def get_words
 		# Fetches an array of all possible combination for two word combinations 
 		i = 2
 		while (i <= 7)
 			list1 = @phone_letters[0..i]
 			list2 = @phone_letters[( i + 1 )..9]
 			generate_words([list1, list2])
 			i += 1
 		end

 		# Fetches an array of all possible combination for three word combinations
	 	generate_words([
	 		@phone_letters[0..2],
 		 	@phone_letters[3..5],
 		  @phone_letters[6..9]
 		])
	 	generate_words([
	 		@phone_letters[0..2],
 		 	@phone_letters[3..6],
 		  @phone_letters[7..9]
 		])
	 	generate_words([
	 		@phone_letters[0..3],
 			@phone_letters[4..6],
 		  @phone_letters[7..9]
 		])
	end

	# Method to generate the words from the letters
	def generate_words(phone_chars_array)

		matched_words = []

		# Combines the characters together to form words (illegible too)
		phone_chars_array.each do |phone_chars|

			# Mapping the array of letters and joining them gives us the words (illegible or not)
			possible_words = phone_chars[0].product(*phone_chars[1..-1]).map(&:join)

			# Rejects words shorter then length of 3
			possible_words.reject! {|x| x.length < 3}

			# Fetches all legible words that match with the dictionary
			matched_words << (possible_words & @dictionary)

			# Removes any empty word combinations
			return if matched_words.any?(&:empty?)
		end

		# Adds the product of matched words that form correct words to @correct_words 
		update_correct_words(matched_words)
	end

	#Method to update the dictionary matched words from the matched_words
	def update_correct_words(matched_words)
		if matched_words.length == 2
			@correct_words << matched_words[0].product(matched_words[1])
		elsif matched_words.length == 3
			@correct_words << matched_words[0].product(*matched_words[1..-1])
		end
	end
end	

# Run this if this file is run directly
unless ENV["CONVERTER_ENV"] == "test"
	convertor = Converter.new
	p convertor.get_word_combinations("6686787825")
end

