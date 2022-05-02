require 'path'

RSpec.describe Path do
  describe 'displayPathtoPrincess' do
    it 'prints the bot movement history to the terminal' do
      expect{Path.displayPathtoPrincess(3, ["---", "-m-", "--p"])}.to output(/DOWN\nRIGHT\n/).to_stdout
    end
  end

  describe 'nextMove' do
    it 'prints the bot next move to the terminal' do
      expect{Path.nextMove(3, 0, 0, ["m--", "---", "--p"])}.to output(/DOWN\n/).to_stdout
    end
  end
end
