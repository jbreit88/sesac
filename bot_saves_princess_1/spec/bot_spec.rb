require 'bot'

RSpec.describe Bot do
  let(:find_bot_coords) { [1,1] } # Middle of a 3x3 grid.
  let(:bot) { Bot.new(find_bot_coords) }

  it 'exists with coordinates' do
    expect(bot).to be_a Bot
    expect(bot.x).to eq 1
    expect(bot.y).to eq 1
  end

  it 'works with any coords' do
    bot_1 = Bot.new([0,3])

    expect(bot_1.x).to eq 0
    expect(bot_1.y).to eq 3
  end
end
