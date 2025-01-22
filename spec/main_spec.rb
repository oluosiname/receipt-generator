# frozen_string_literal: true

require 'main'

describe Main do
  describe '.run' do
    let(:input_file_1) { './spec/fixtures/01_example.txt' }
    let(:input_file_2) { './spec/fixtures/02_example.txt' }
    let(:input_file_3) { './spec/fixtures/03_example.txt' }
    let(:invalid_file) { './spec/fixtures/non_existent_file.txt' }
    let(:expected_output_1) do
      <<~OUTPUT
        2 book: 24.98
        1 music CD: 16.49
        1 chocolate bar: 0.85
        Sales Taxes: 1.50
        Total: 42.32
      OUTPUT
    end
    let(:expected_output_2) do
      <<~OUTPUT
        1 imported box of chocolates: 10.50
        1 imported bottle of perfume: 54.65
        Sales Taxes: 7.65
        Total: 65.15
      OUTPUT
    end
    let(:expected_output_3) do
      <<~OUTPUT
        1 imported bottle of perfume: 32.19
        1 bottle of perfume: 20.89
        1 packet of headache pills: 9.75
        3 imported boxes of chocolates: 35.55
        Sales Taxes: 7.90
        Total: 98.38
      OUTPUT
    end

    context 'when the input file is valid' do
      it 'prints the receipt to stdout' do
        expect { described_class.run(input_file_1) }.to output(expected_output_1).to_stdout
      end

      it 'prints the receipt to stdout' do
        expect { described_class.run(input_file_2) }.to output(expected_output_2).to_stdout
      end

      it 'prints the receipt to stdout' do
        expect { described_class.run(input_file_3) }.to output(expected_output_3).to_stdout
      end
    end

    context 'when input file is missing' do
      it 'prints error message and exits with status 1' do
        output = StringIO.new
        $stdout = output

        begin
          Main.run(nil)
        rescue SystemExit => e
          expect(e.status).to eq(1)
          expect(output.string).to eq("Error: Input file is missing\n")
        ensure
          $stdout = STDOUT
        end
      end
    end

    context 'when input file does not exist' do
      let(:non_existent_file) { 'non_existent.txt' }

      before do
        allow(File).to receive(:exist?).with(non_existent_file).and_return(false)
        allow(File).to receive(:readable?).with(non_existent_file).and_return(true)
      end

      it 'prints error message and exits with status 1' do
        output = StringIO.new
        $stdout = output

        begin
          Main.run(non_existent_file)
        rescue SystemExit => e
          expect(e.status).to eq(1)
          expect(output.string).to eq("Error: Input file does not exist or is not readable\n")
        ensure
          $stdout = STDOUT
        end
      end
    end

    context 'when input file is not readable' do
      let(:unreadable_file) { 'unreadable.txt' }

      before do
        allow(File).to receive(:exist?).with(unreadable_file).and_return(true)
        allow(File).to receive(:readable?).with(unreadable_file).and_return(false)
      end

      it 'prints error message and exits with status 1' do
        output = StringIO.new
        $stdout = output

        begin
          Main.run(unreadable_file)
        rescue SystemExit => e
          expect(e.status).to eq(1)
          expect(output.string).to eq("Error: Input file does not exist or is not readable\n")
        ensure
          $stdout = STDOUT
        end
      end
    end
  end
end
