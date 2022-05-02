require 'princess'

RSpec.describe Princess do
  let(:find_princess_coords) { [1,2] } # Middle of a 3x3 grid.
  let(:princess) { Princess.new(find_princess_coords) }

  it 'exists with coordinates' do
    expect(princess).to be_a Princess
    expect(princess.r).to eq 1
    expect(princess.c).to eq 2
  end
end
