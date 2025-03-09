require_relative '../manipulate_string'
require 'byebug'


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
    expect(string_calculate.add("2,4000000")).to eq(4000002)
  end

  it "handles an unknown number of values" do
    expect(string_calculate.add("1,2,3,4")).to eq(10)
    expect(string_calculate.add("10,20,30,40,50")).to eq(150)
  end

  it "raises an ArgumentError when any invalid string is provided" do
    invalid_inputs = ["1,b,3,4", "10,20,*,%,50", "abc", "5\n,6,a", "$,#,@,&,%,^,(])"]
    invalid_inputs.each do |input|
      expect { string_calculate.add(input) }.to raise_error(ArgumentError, "Invalid input format: Only numbers are allowed")
    end
  end

  it "handles newlines as delimiters" do
    expect(string_calculate.add("1\n2,3")).to eq(6)
    expect(string_calculate.add("5\n10,15")).to eq(30)
  end

  it "supports custom delimiters" do
    expect(string_calculate.add("//;\n1;2")).to eq(3)
    expect(string_calculate.add("//|\n2|3|4")).to eq(9)
    expect(string_calculate.add("//@\n4@5@6")).to eq(15)
  end

  it "raises an exception for negative numbers" do
    expect { string_calculate.add("1,-2,3,-4") }.to raise_error("negative numbers not allowed: -2, -4")
    expect { string_calculate.add("-5,-10") }.to raise_error("negative numbers not allowed: -5, -10")
  end

  it "raises an exception when both positive and negative numbers are provided" do
    expect { string_calculate.add("1,-2,3,-4,5") }.to raise_error("negative numbers not allowed: -2, -4")
    expect { string_calculate.add("10,-5,20,-15,30") }.to raise_error("negative numbers not allowed: -5, -15")
  end  
end


