require_relative '../manipulate_string'

RSpec.describe ManipulateString do
  let(:string_calulate) { ManipulateString.new }

  it 'returns 0 for an empty string' do
    expect(string_calulate.add('')).to eq(0)
  end
end


