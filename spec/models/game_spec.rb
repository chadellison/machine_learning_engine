require 'rails_helper'

RSpec.describe Game, type: :model do
  it "has many board_setup_games" do
    expect(Game.new).to respond_to(:board_setup_games)
  end

  it "has many board_setups" do
    expect(Game.new).to respond_to(:board_setups)
  end
end
