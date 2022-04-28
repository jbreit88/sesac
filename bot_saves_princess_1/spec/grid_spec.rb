require 'grid'

RSpec.describe Grid do
  it 'exists with attributes' do
    grid_size = 3
    grid_input = "---\n-m-\np--"

    grid = Grid.new(grid_size, grid_input)

    expect(grid).to be_a Grid
    expect(grid.size).to eq(grid_size)
    expect(grid.board).to eq(grid_input)
  end
end
