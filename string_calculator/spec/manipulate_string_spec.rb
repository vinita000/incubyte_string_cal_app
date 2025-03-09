require_relative '../manipulate_string'

RSpec.describe ManipulateString do
  let(:string_calculate) { ManipulateString.new }

  it 'returns 0 for an empty string' do
    expect(string_calculate.add('')).to eq(0)
  end

  it 'raises an ArgumentError when input is not a string' do
    invalid_inputs = [123, ["1", "2,3"], nil]
  
    invalid_inputs.each do |input|
      expect { string_calculate.add(input) }.to raise_error(ArgumentError, "Input must be a string")
    end
  end

  it "returns the number itself for a single number" do
    expect(string_calculate.add("1")).to eq(1)
    expect(string_calculate.add("5")).to eq(5)
  end

  it "raises an ArgumentError when an invalid string is provided" do
    expect { string_calculate.add("a") }.to raise_error(ArgumentError, "Invalid input format: Only numbers are allowed")
  end

  it "returns the sum of two numbers" do
    expect(string_calculate.add("1,5")).to eq(6)
    expect(string_calculate.add("2,4")).to eq(6)
  end

end


