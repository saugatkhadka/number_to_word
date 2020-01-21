# Convert numbers to word

# Steps
# 1. Take a number as input. Expose a public function
# 2. Separate the last 10 numbers, or those with dashes
# 3. Generate the possible combinations from the number given
# 4. Match the word combinations with the library/dictionary
# 5. Create an array of the matching combinations of words and return them in an array


class Converter

  def initialize(phone_number)
  	@phone_number = phone_number.to_s
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
  	@dictionary = []
  	@correct_words = []
  end


  def get_letter_combinations
  	# TODO: Phone Number validation
  	@phone_letter = []

  	number = @phone_number.split("")

  	number.each do |letter|
  		@phone_letter << @digit_to_character[letter]
  	end
  	# p @phone_letter	# This is the letter combination for the given number
  	get_words(@phone_letter)


	end

	def get_words(letter_combination)
		# Get the number of word combinations possible
	 	# Words have to be at least 3 characters.

	 	# 3+7, 4+6, 5+5, 6+4, 7+3, 3+3+4, 3+4+3, 4+3+3
	 	# Generate all word combinations in these order from the letter comibinations available
	 	generate_words([letter_combination[0..2], letter_combination[3..9]])
	 	generate_words([letter_combination[0..3], letter_combination[4..9]])
	 	generate_words([letter_combination[0..4], letter_combination[5..9]])
	 	generate_words([letter_combination[0..5], letter_combination[6..9]])
	 	generate_words([letter_combination[0..6], letter_combination[7..9]])

	 	generate_words([
	 		letter_combination[0..2],
 		 	letter_combination[3..5],
 		  letter_combination[6..9]
 		])
	 	generate_words([
	 		letter_combination[0..2],
 		 	letter_combination[3..6],
 		  letter_combination[7..9]
 		])
	 	generate_words([
	 		letter_combination[0..3],
 			letter_combination[4..6],
 		  letter_combination[7..9]
 		])

	end

	def generate_words(phone_chars_array)
		# p phone_char_array
		# [ [[],[],[]] , [[],[],[],[],[],[]] ]
		# [ [[],[],[]], [[],[],[]] ]
		# phone_char_array receives an array of the two or three letter_combination of arrays 
		# of the letters/chars
		matched_words = []
		phone_chars_array.each do |phone_chars|
			# Combines the characters together to form words (illegible too)
			# p phone_chars

			# *phone_chars flattens the array and product between the arrays generate array of 
			# letters.
			# Mapping the array of letters and joining them gives us the words (illegible or not)
			possible_words = phone_chars[0].product(*phone_chars[1..-1]).map(&:join)

			possible_words.reject! {|x| x.length < 3}
			# p possible_words

			# Match with dictionary for correct words
			matched_words << (possible_words & @dictionary)
			# p matched_words
			return if matched_words.any?(&:empty?)
		end

		# p matched_words
		# TODO:  Need to match the words in correct order?
		# Combining the words in correct order and form. for 2 and for 3 word combination

		# Adds the product of matched words that form correct words to @correct_words 
		if matched_words.length == 2
			@correct_words << matched_words[0].product(matched_words[1])
		elsif matched_words.length == 3
			@correct_words << matched_words[0].product(*matched_words[1..-1])
		end

		# p @correct_words

	end

	def load_dictionary
		File.open(Dir.pwd + '/data/dictionary.txt').each { |line| @dictionary << line.strip }
		puts "Dictionary is Loaded..."
	end


	def get_word_combinations
		load_dictionary
		get_letter_combinations

		# p @correct_words

		return @correct_words
	end
end	

convert = Converter.new("6686787825")
convert.get_word_combinations