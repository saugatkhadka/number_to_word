ENV["CONVERTER_ENV"] = "test"
require 'converter'

describe Converter do 

	let(:phone_number_1) { '6686787825' }
  let(:result_1) { [%w[NOUN STRUCK], %w[ONTO STRUCK], %w[MOTOR TRUCK], %w[MOTOR USUAL],
                   %w[NOUNS TRUCK], %w[NOUNS USUAL], %w[MOT OPT PUCK], %w[MOT OPT RUCK],
                   %w[MOT OPT SUCK], %w[MOT ORT PUCK], %w[MOT ORT RUCK], %w[MOT ORT SUCK],
                   %w[NOT OPT PUCK], %w[NOT OPT RUCK], %w[NOT OPT SUCK], %w[NOT ORT PUCK],
                   %w[NOT ORT RUCK], %w[NOT ORT SUCK], %w[OOT OPT PUCK], %w[OOT OPT RUCK],
                   %w[OOT OPT SUCK], %w[OOT ORT PUCK], %w[OOT ORT RUCK], %w[OOT ORT SUCK],
                   %w[MOT OPTS TAJ], %w[MOT OPUS TAJ], %w[MOT ORTS TAJ], %w[NOT OPTS TAJ],
                   %w[NOT OPUS TAJ], %w[NOT ORTS TAJ], %w[OOT OPTS TAJ], %w[OOT OPUS TAJ],
                   %w[OOT ORTS TAJ], %w[NOUN PUP TAJ], %w[NOUN PUR TAJ], %w[NOUN PUS TAJ],
                   %w[NOUN SUP TAJ], %w[NOUN SUQ TAJ], %w[ONTO PUP TAJ], %w[ONTO PUR TAJ],
                   %w[ONTO PUS TAJ], %w[ONTO SUP TAJ], %w[ONTO SUQ TAJ]] }

  let(:phone_number_2) { '2282668687' }
  let(:result_2) { [%w[ACT BOO TOTS], %w[ACT BOO TOUR], %w[ACT CON TOTS], %w[ACT CON TOUR],
                   %w[ACT COO TOTS], %w[ACT COO TOUR], %w[BAT BOO TOTS], %w[BAT BOO TOUR],
                   %w[BAT CON TOTS], %w[BAT CON TOUR], %w[BAT COO TOTS], %w[BAT COO TOUR],
                   %w[CAT BOO TOTS], %w[CAT BOO TOUR], %w[CAT CON TOTS], %w[CAT CON TOUR],
                   %w[CAT COO TOTS], %w[CAT COO TOUR], %w[ACT BOOT MUS], %w[ACT BOOT NUS],
                   %w[ACT BOOT OUR], %w[ACT COOT MUS], %w[ACT COOT NUS], %w[ACT COOT OUR],
                   %w[BAT BOOT MUS], %w[BAT BOOT NUS], %w[BAT BOOT OUR], %w[BAT COOT MUS],
                   %w[BAT COOT NUS], %w[BAT COOT OUR], %w[CAT BOOT MUS], %w[CAT BOOT NUS],
                   %w[CAT BOOT OUR], %w[CAT COOT MUS], %w[CAT COOT NUS], %w[CAT COOT OUR],
                   %w[ACT AMOUNTS], %w[ACT CONTOUR], %w[BAT AMOUNTS], %w[BAT CONTOUR],
                   %w[CAT AMOUNTS], %w[CAT CONTOUR], %w[ACTA MOT MUS], %w[ACTA MOT NUS],
                   %w[ACTA MOT OUR], %w[ACTA NOT MUS], %w[ACTA NOT NUS], %w[ACTA NOT OUR],
                   %w[ACTA OOT MUS], %w[ACTA OOT NUS], %w[ACTA OOT OUR],
                   %w[ACTA MOUNTS]] }

  let(:phone_number_3) {'2233115500'}

	context 'Given a valid phone number 1' do
		it 'outputs a list of word combinations' do 
			puts 'Phone Number: ' + phone_number_1
			object = Converter.new
			expect(object.get_word_combinations(phone_number_1)).to match_array(result_1)
		end
	end

	context 'Given a valid phone number 2' do
		it 'outputs a list of word combinations' do 
			puts 'Phone Number: ' + phone_number_2
			object = Converter.new
			expect(object.get_word_combinations(phone_number_2)).to match_array(result_2)
		end
	end

  context 'Given an invalid phone number 3' do
    it 'raises an runtime error' do 
      puts 'Phone Number: ' + phone_number_3
      object = Converter.new
      expect{object.get_word_combinations(phone_number_3)}.to raise_error(RuntimeError, "The given phone number is invalid. Please try again.")
    end
  end

end