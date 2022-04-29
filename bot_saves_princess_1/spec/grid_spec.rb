require 'grid'

RSpec.describe Grid do
  let(:grid_size) { 3 }
  let(:grid_input) { "---\n-m-\np--" }
  let(:grid) { Grid.new(grid_size, grid_input) }

  it 'exists with attributes' do
    expect(grid).to be_a Grid
    expect(grid.size).to eq(grid_size)
    expect(grid.board).to eq(grid_input)
  end

  describe 'instance methods' do
    describe 'to_matrix' do
      it 'takes board input and changes it to a 2D array' do
        expect(grid.to_matrix).to be_a Matrix
        expect(grid.to_matrix).to eq(Matrix[["-", "-", "-"], ["-", "m", "-"], ["p", "-", "-"]])
      end
    end

    describe 'locate_princess' do
      it 'searches the grid for the princess and returns her current coordinates' do
        expect(grid.locate_princess).to eq([2,0])
      end

      it 'returns princess location for all corners' do
        princess_top_left = "p--\n-m-\n---"
        princess_top_right = "--p\n-m-\np--"
        princess_bottom_left = "---\n-m-\np--"
        princess_bottom_right = "---\n-m-\n--p"

        grid_1 = Grid.new(grid_size, princess_top_left)
        grid_2 = Grid.new(grid_size, princess_top_right)
        grid_3 = Grid.new(grid_size, princess_bottom_left)
        grid_4 = Grid.new(grid_size, princess_bottom_right)

        expect(grid_1.locate_princess).to eq([0,0])
        expect(grid_2.locate_princess).to eq([0,2])
        expect(grid_3.locate_princess).to eq([2,0])
        expect(grid_4.locate_princess).to eq([2,2])
      end
    end

    describe 'locate_bot' do
      it 'searches the grid for the bot and returns its current coordinates' do
        expect(grid.locate_bot).to eq([1,1])
      end
    end
  end
end
