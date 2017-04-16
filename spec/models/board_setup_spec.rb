require 'rails_helper'

RSpec.describe BoardSetup, type: :model do
  it "has many 'next_moves'" do
    board_setup = BoardSetup.create
    next_move = NextMove.create

    board_setup.next_moves << next_move
    expect(board_setup.next_moves).to eq [next_move]
  end

  it "has many board_setup_games" do
    expect(BoardSetup.new).to respond_to(:board_setup_games)
  end

  it "has many games" do
    expect(BoardSetup.new).to respond_to(:games)
  end
end
