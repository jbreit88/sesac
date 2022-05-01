require 'next_move'

RSpec.describe NextMove do
  # Remove terminal print out during tests.
  before(:each) do
    allow($stdout).to receive(:write)
  end

  describe 'user_input' do
    it 'takes in user input and returns it with no line break' do
      allow($stdin).to receive(:gets).and_return('This is the user input')

      expect(NextMove.user_input).to eq('This is the user input')
    end
  end

  describe 'get_user_inputs' do
    it 'prompts user for input, sanitizes it, and checks that it is valid input, creates a grid, which returns the path a bot must take to get to the princess' do

      allow(NextMove).to receive(:user_input).and_return('3', '2', '2', 'y', 'n')

      allow(NextMove).to receive(:gets).and_return('p--', '---', '--m')

      expect(NextMove.get_user_inputs).to eq(['UP'])
    end

    it 'dynamically adjusts for grid size and user input' do

      allow(NextMove).to receive(:user_input).and_return('5', '0', '0', 'y', 'y', 'n')

      allow(NextMove).to receive(:gets).and_return('m----', '-----', '-----', '-----', 'p----')

      expect(NextMove.get_user_inputs).to eq(['DOWN', 'DOWN'])
    end
  end

  describe 'make_grid' do
    it 'takes in grid size and bot coordinates, then has user input a grid and checks grid validity before returning the bot path to princess' do
      allow(NextMove).to receive(:user_input).and_return('y', 'y', 'n')

      allow(NextMove).to receive(:gets).and_return('p--', '---', '--m')

      expect(NextMove.make_grid(3, ['2', '2'])).to eq(['UP', 'UP'])
    end

    it 'dynamically adjusts for grid size and user input' do
      allow(NextMove).to receive(:user_input).and_return('y', 'y', 'n')

      allow(NextMove).to receive(:gets).and_return('p----', '-----', 'm----', '-----', '-----')

      expect(NextMove.make_grid(5, ['2', '0'])).to eq(['UP', 'UP'])
    end
  end

  describe 'error handling' do
    describe 'wrong_number_chars?' do
      it 'returns true if the number of characters in grid is more than the square of the grids size' do
        expect(NextMove.wrong_number_chars?(3, "----m-p---")).to eq true
      end

      it 'returns true if characters in grid are not valid m, p, or -' do
        expect(NextMove.wrong_number_chars?(3, "-d--m-p--")).to eq true
      end

      it 'returns true if more than one m in grid' do
        expect(NextMove.wrong_number_chars?(3, "---mm-p--")).to eq true
      end

      it 'returns true if more than one p in grid' do
        expect(NextMove.wrong_number_chars?(3, "----m-p-p")).to eq true
      end

      it 'returns true there is no m in grid' do
        expect(NextMove.wrong_number_chars?(3, "------p--")).to eq true
      end

      it 'returns true if there is no p in grid' do
        expect(NextMove.wrong_number_chars?(3, "----m----")).to eq true
      end

      it 'returns true if there is no p and no m in grid' do
        expect(NextMove.wrong_number_chars?(3, "---------")).to eq true
      end

      it 'returns true if there is an incorrect number of -s' do
        expect(NextMove.wrong_number_chars?(3, "------p--")).to eq true
      end

      it 'returns false if the grid size and available characters are valid' do
        expect(NextMove.wrong_number_chars?(3, "----m-p--")).to eq false
      end

      it 'returns false if the grid size and available characters are valid and larger' do
        expect(NextMove.wrong_number_chars?(5, "-------m--p----")).to eq true
      end
    end

    describe 'bot_coords_not_match_grid?' do
      describe 'checks if user input bot_coordinates match the placement of the bot in the grid input by the user' do
        it 'returns true if the bot coordinates do not match the bot placement on board' do
          expect(NextMove.bot_coords_not_match_grid?(3, 'm-------p', ['0', '1'])).to eq true # bot coords should be ['0', '0']
        end

        it 'returns false if the bot coordinates match the bot placement on board' do
          expect(NextMove.bot_coords_not_match_grid?(3, 'm-------p', ['0', '0'])).to eq false
        end
      end
    end

    describe 'bot_found_princess?' do
      it 'returns false if bot_coords do not match princess_coords' do
        expect(NextMove.bot_found_princess?([0, 1], [0,2])).to eq false
      end

      it 'returns true if bot_coords match princess_coords' do
        expect(NextMove.bot_found_princess?([0, 1], [0,1])).to eq true
      end
    end
  end

  describe 'board creation' do
    describe 'grid_to_matrix' do
      it 'takes in a grid size and grid string and renders a matrix for easily finding coordinates' do
        expect(NextMove.grid_to_matrix(3, '----m-p--')).to be_a Matrix
        expect(NextMove.grid_to_matrix(3, '----m-p--')).to eq(Matrix[["-", "-", "-"], ["-", "m", "-"], ["p", "-", "-"]])
      end
    end
  end

  describe 'coordinates helper methods' do
    let(:matrix) { NextMove.grid_to_matrix(3, '----m-p--')}

    describe 'find_princess' do
      it 'searches the matrix for p and returns the coordinates' do
        expect(NextMove.find_princess(3, '----m-p--')).to eq([2,0])
      end
    end

    describe 'find_bot' do
      it 'searches the matrix for m and returns the coordinates' do
        expect(NextMove.find_bot(matrix)).to eq([1,1])
      end
    end
  end
end
