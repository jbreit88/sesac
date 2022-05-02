require 'path_to_princess'

RSpec.describe PathToPrincess do
  # Remove terminal print out during tests.
  before(:each) do
    allow($stdout).to receive(:write)
  end

  describe 'user_input' do
    before(:each) do
      allow($stdin).to receive(:gets).and_return('This is the user input')
    end

    it 'takes in user input and returns it with no line break' do
      expect(PathToPrincess.user_input).to eq('This is the user input')
    end
  end

  describe 'get_user_inputs' do
    it 'prompts user for input, sanitizes it, and checks that it is valid input, creates a grid, which returns the path a bot must take to get to the princess' do

      allow(PathToPrincess).to receive(:user_input).and_return('3')

      allow(PathToPrincess).to receive(:gets).and_return('---', '-m-', 'p--')

      expect(PathToPrincess.get_user_inputs).to eq(["DOWN", "LEFT"])
    end

    it 'dynamically adjusts for grid size and user input' do

      allow(PathToPrincess).to receive(:user_input).and_return('5')

      allow(PathToPrincess).to receive(:gets).and_return('-----', '-----', '--m--', '-----', 'p----')

      expect(PathToPrincess.get_user_inputs).to eq(["DOWN", "DOWN", "LEFT", "LEFT"])
    end
  end

  describe 'make_grid' do
    it 'takes in grid size from #get_user_inputs, has user input a grid and checks grid validity before returning the bot path to princess' do
      allow(PathToPrincess).to receive(:gets).and_return('---', '-m-', 'p--')

      expect(PathToPrincess.make_grid(3)).to eq(["DOWN", "LEFT"])
    end

    it 'dynamically adjusts for grid size and user input' do
      allow(PathToPrincess).to receive(:gets).and_return('-----', '-----', '--m--', '-----', 'p----')

      expect(PathToPrincess.make_grid(5)).to eq(["DOWN", "DOWN", "LEFT", "LEFT"])
    end
  end

  describe 'error handling' do
    describe 'wrong_number_chars?' do
      it 'returns true if the number of characters in grid is more than the square of the grids size' do
        expect(PathToPrincess.wrong_number_chars?(3, "----m-p---")).to eq true
      end

      it 'returns true if characters in grid are not valid m, p, or -' do
        expect(PathToPrincess.wrong_number_chars?(3, "-d--m-p--")).to eq true
      end

      it 'returns true if more than one m in grid' do
        expect(PathToPrincess.wrong_number_chars?(3, "---mm-p--")).to eq true
      end

      it 'returns true if more than one p in grid' do
        expect(PathToPrincess.wrong_number_chars?(3, "----m-p-p")).to eq true
      end

      it 'returns true if there is an incorrect number of -s' do
        expect(PathToPrincess.wrong_number_chars?(3, "------p--")).to eq true
      end

      it 'returns false if the grid size and available characters are valid' do
        expect(PathToPrincess.wrong_number_chars?(3, "----m-p--")).to eq false
      end

      it 'returns false if the grid size and available characters are valid and larger' do
        expect(PathToPrincess.wrong_number_chars?(5, "-------m--p----")).to eq true
      end
    end

    describe 'princess_not_in_corner?' do
      it 'returns false if the princess is in a corner' do
        expect(PathToPrincess.princess_not_in_corner?(3, "----m-p--")).to eq false
        expect(PathToPrincess.princess_not_in_corner?(3, "p---m----")).to eq false
        expect(PathToPrincess.princess_not_in_corner?(3, "--p-m----")).to eq false
        expect(PathToPrincess.princess_not_in_corner?(3, "----m---p")).to eq false
      end

      it 'returns true if the princess is not in a corner' do
        expect(PathToPrincess.princess_not_in_corner?(3, "----mp---")).to eq true
        expect(PathToPrincess.princess_not_in_corner?(3, "-p--m----")).to eq true
        expect(PathToPrincess.princess_not_in_corner?(3, "----m--p-")).to eq true
      end
    end

    describe 'bot_not_in_center?' do
      it 'returns false if bot coords are the center coords' do
        expect(PathToPrincess.bot_not_in_center?(3, "----m-p--")).to eq false
      end

      it 'returns true if bot coords are not the center coords' do
        expect(PathToPrincess.bot_not_in_center?(3, "-m----p--")).to eq true
        expect(PathToPrincess.bot_not_in_center?(3, "m-----p--")).to eq true
        expect(PathToPrincess.bot_not_in_center?(3, "------pm-")).to eq true
      end
    end
  end

  describe 'board creation' do
    describe 'grid_to_matrix' do
      it 'takes in a grid size and grid string and renders a matrix for easily finding coordinates' do
        expect(PathToPrincess.grid_to_matrix(3, '----m-p--')).to be_a Matrix
        expect(PathToPrincess.grid_to_matrix(3, '----m-p--')).to eq(Matrix[["-", "-", "-"], ["-", "m", "-"], ["p", "-", "-"]])
      end
    end
  end

  describe 'coordinates helper methods' do
    let(:matrix) { PathToPrincess.grid_to_matrix(3, '----m-p--')}

    describe 'find_princess' do
      it 'searches the matrix for p and returns the coordinates' do
        expect(PathToPrincess.find_princess(matrix)).to eq([2,0])
      end
    end

    describe 'find_bot' do
      it 'searches the matrix for m and returns the coordinates' do
        expect(PathToPrincess.find_bot(matrix)).to eq([1,1])
      end
    end

    describe 'corners' do
      it 'returns the corner coordinates for the grid with 3' do
        expect(PathToPrincess.corners(3)).to eq([[0,0], [0,2], [2,0], [2,2]])
      end

      it 'returns the corner coordinates for the grid with 5' do
        expect(PathToPrincess.corners(5)).to eq([[0,0], [0,4], [4,0], [4,4]])
      end
    end

    describe 'find_center_coords' do
      it 'returns the center coordinates for the grid size 3' do
        expect(PathToPrincess.find_center_coords(3)).to eq([1,1])
      end
      it 'returns the center coordinates for the grid size 5' do
        expect(PathToPrincess.find_center_coords(5)).to eq([2,2])
      end
    end
  end

end
