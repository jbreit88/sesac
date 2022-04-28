require 'princess'

RSpec.describe Princess do
  let(:find_princess_coords) { [1,1] } # Middle of a 3x3 grid.
  let(:princess) { Princess.new(find_princess_coords) }

  it 'exists with coordinates' do
    expect(princess).to be_a Princess
    expect(princess.x).to eq 1
    expect(princess.y).to eq 1
  end

  it 'works with any coords' do
    princess_1 = Princess.new([0,3])

    expect(princess_1.x).to eq 0
    expect(princess_1.y).to eq 3
  end
end
