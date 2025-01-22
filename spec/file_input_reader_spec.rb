# frozen_string_literal: true

require 'file_input_reader'

describe FileInputReader do
  expectations = {
    '01_example.txt' => ['2 book at 12.49', '1 music CD at 14.99', '1 chocolate bar at 0.85'],
    '02_example.txt' => ['1 imported box of chocolates at 10.00', '1 imported bottle of perfume at 47.50'],
    '03_example.txt' => [
      '1 imported bottle of perfume at 27.99',
      '1 bottle of perfume at 18.99', '1 packet of headache pills at 9.75',
      '3 imported boxes of chocolates at 11.25'
    ]
  }

  expectations.each do |file_name, expected_output|
    it "parses #{file_name} and returns the expected array of data" do
      file_path = File.join('spec/fixtures', file_name)
      expect(FileInputReader.parse(file_path)).to eq(expected_output)
    end
  end
end
