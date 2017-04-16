require "rails_helper"

describe BoardSetupGame do
  it "belongs to a game" do
    expect(BoardSetupGame.new).to respond_to(:game)
  end

  it "belongs to a board_setup" do
    expect(BoardSetupGame.new).to respond_to(:board_setup)
  end
end
