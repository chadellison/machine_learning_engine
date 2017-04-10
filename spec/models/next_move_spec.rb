require 'rails_helper'

RSpec.describe NextMove, type: :model do
  it "belongs to a board_setup" do
    board_setup = BoardSetup.create
    next_move = NextMove.create

    board_setup.next_moves << next_move
    expect(next_move.board_setup).to eq board_setup
  end
end
