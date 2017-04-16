require 'rails_helper'

RSpec.describe Game, type: :model do
  it "has many board_setup_games" do
    expect(Game.new).to respond_to(:board_setup_games)
  end

  it "has many board_setups" do
    expect(Game.new).to respond_to(:board_setups)
  end

  describe "update_rankings" do
    context "when there is no winner" do
      it "returns nil" do
        expect(Game.create.update_rankings(nil)).to be_nil
      end
    end

    context "when there is a winner" do
      it "updates the rank of the next moves for the winner and loser" do
        game = Game.create
        board_setup = game.board_setups.create
        board_setup2 = game.board_setups.create

        next_move = NextMove.create(value: "x", rank: 0, board_setup_id: board_setup.id)
        next_move2 = NextMove.create(value: "o", rank: 0, board_setup_id: board_setup2.id)

        board_setup.update(chosen_move_id: next_move.id)
        board_setup2.update(chosen_move_id: next_move2.id)
        
        game.update_rankings("x")
        expect(next_move.reload.rank).to eq 1
        expect(next_move2.reload.rank).to eq -1
      end
    end
  end
end
