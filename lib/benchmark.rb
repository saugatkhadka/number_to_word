ENV["CONVERTER_ENV"] = "test"

require 'benchmark'
require_relative 'converter.rb'

Benchmark.bm do |x|
	x.report {
		# puts 'Beginning benchmark...'
		# puts 'Phone Number : 6686787825'
		# puts ""

		object = Converter.new
		object.get_word_combinations("6686787825")
	}
end
puts "\n (in seconds.)"
