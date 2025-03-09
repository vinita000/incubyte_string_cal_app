require_relative '../manipulate_string'

RSpec.describe ManipulateString do
  let(:string_calculate) { ManipulateString.new }

  it 'returns 0 for an empty string' do
    expect(string_calculate.add('')).to eq(0)
  end

  it 'raises an ArgumentError when input is not a integer' do
    expect { string_calculate.add(123) }.to raise_error(ArgumentError, "Input must be a string")
  end

end


