require 'grid'

RSpec.describe Grid do
  let(:grid_size) { 3 }
  let(:grid_input) { "----m-p--" }
  let(:grid) { Grid.new(grid_size, grid_input) }

  it 'exists with attributes' do
    expect(grid).to be_a Grid
    expect(grid.size).to eq(grid_size)
    expect(grid.board).to eq([["-", "-", "-"], ["-", "m", "-"], ["p", "-", "-"]])
    expect(grid.matrix).to eq(Matrix[["-", "-", "-"], ["-", "m", "-"], ["p", "-", "-"]])
  end

  describe 'instance methods' do
    describe 'to_matrix_array' do
      it 'takes in the grid string and renders a 2D array' do
        expect(grid.to_matrix_array(grid_input)).to eq([["-", "-", "-"], ["-", "m", "-"], ["p", "-", "-"]])
      end
    end

    describe 'to_matrix' do
      it 'takes 2D board array and makes a matrix' do
        expect(grid.to_matrix).to be_a Matrix
        expect(grid.to_matrix).to eq(Matrix[["-", "-", "-"], ["-", "m", "-"], ["p", "-", "-"]])
      end
    end

    describe 'princess_coords' do
      it 'searches the grid for the princess and returns her current coordinates' do
        expect(grid.princess_coords).to eq([2,0])
      end
    end

    describe 'bot_coords' do
      it 'searches the grid for the bot and returns its current coordinates' do
        expect(grid.bot_coords).to eq([1,1])
      end
    end

    describe 'update_board' do
      it 'updates the grid with new bot location' do
        expect(grid.board).to eq([["-", "-", "-"], ["-", "m", "-"], ["p", "-", "-"]])

        grid.update_board([1, 2])

        expect(grid.board).to eq([["-", "-", "-"], ["-", "-", "m"], ["p", "-", "-"]])
      end
    end
  end
end
