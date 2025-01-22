# frozen_string_literal: true

require_relative 'file_input_reader'
require_relative 'cart_builder'
require_relative 'receipt'

class Main
  def self.run(input_file)
    raise ArgumentError, 'Input file is missing' unless input_file

    unless File.exist?(input_file) && File.readable?(input_file)
      raise ArgumentError,
            'Input file does not exist or is not readable'
    end

    input_lines = FileInputReader.parse(input_file)
    items = CartBuilder.new(lines: input_lines).build

    receipt = Receipt.new(items:)
    puts receipt.print
  rescue ArgumentError => e
    puts "Error: #{e.message}"
    exit 1
  rescue StandardError => e
    puts "Unexpected error: #{e.message}"
    exit 2
  end
end

if $PROGRAM_NAME == __FILE__
  input_file = ARGV[0]
  Main.run(input_file)
end
