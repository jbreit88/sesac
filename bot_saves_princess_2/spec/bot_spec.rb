require 'bot'

RSpec.describe Bot do
  let(:find_bot_coords) { [1,2] } # Middle of a 3x3 grid.
  let(:bot) { Bot.new(find_bot_coords) }

  it 'exists with coordinates' do
    expect(bot).to be_a Bot
    expect(bot.r).to eq 1
    expect(bot.c).to eq 2
  end

  it "can update it's move history" do
    expect(bot.move_history).to eq([])

    move_1 = "UP"
    bot.update_move_history(move_1)

    expect(bot.move_history).to eq(['UP'])

    move_2 = "LEFT"
    bot.update_move_history(move_2)

    expect(bot.move_history).to eq(['UP', 'LEFT'])
  end
end
