require 'bot'

RSpec.describe Bot do
  let(:find_bot_coords) { [1,2] } # Middle of a 3x3 grid.
  let(:bot) { Bot.new(find_bot_coords) }

  it 'exists with coordinates' do
    expect(bot).to be_a Bot
    expect(bot.r).to eq 1
    expect(bot.c).to eq 2
  end

  it 'can update the coords' do
    bot.update_coords([0,3])
    expect(bot.r).to eq 0
    expect(bot.c).to eq 3
  end

  it 'can save the move history' do
    expect(bot.move_history).to eq([])

    bot.update_move_history('UP')

    expect(bot.move_history).to eq(['UP'])
  end
end
