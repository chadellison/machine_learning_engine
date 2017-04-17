require "rails_helper"

describe Engine do
  describe "train" do
    it "calls 'play_self' the number of times passed in" do
      engine = Engine.new

      expect_any_instance_of(Engine).to receive(:play_self).twice
      engine.train(2)
    end
  end

  describe "play_self" do
    let(:engine) { Engine.new }
    it "creates a game" do
      expect{ engine.play_self }.to change{ Game.count }.by(1)
    end

    it "calls 'find_winner' on a board_setup" do
      expect_any_instance_of(BoardSetup).to receive(:find_winner)
      engine.play_self
    end

    it "calls 'update_rankings' on a game" do
      expect_any_instance_of(Game).to receive(:update_rankings)
      engine.play_self
    end
  end

  describe "new_game" do
    let(:engine) { Engine.new }
    let(:game) { Game.create }
    let(:empty_board) {
      { a1: nil, a2: nil, a3: nil, b1: nil, b2: nil, b3: nil, c1: nil, c2: nil,
        c3: nil }
    }

    it "returns an empty board associated with the game" do
      expect(engine.new_game(game).class).to eq BoardSetup
      expect(engine.new_game(game)).to eq game.board_setups.last
      expect(engine.new_game(game).positions).to eq empty_board
    end
  end

  describe "make_move" do
    let(:engine) { Engine.new }
    let(:game) { Game.create }

    it "returns a new board_setup with all of the previous positions plus one" do
      board_setup = game.board_setups.create(a1: "x", b1: "o", c1: "x")

      result = engine.make_move(board_setup, game)

      expect(result.find_current_positions[:a1]).to eq "x"
      expect(result.find_current_positions[:b1]).to eq "o"
      expect(result.find_current_positions[:c1]).to eq "x"
      expect(result.find_current_positions.values.compact.count).to eq 4
    end
  end

  describe "new_positions" do
    let(:engine) { Engine.new }

    it "returns all of the old positions plus a position of the next move" do
      board_setup = BoardSetup.create(a1: "x", b1: "o", c1: "x")

      next_move = board_setup.next_moves.sample

      result = engine.new_positions(board_setup, next_move)

      expect(result[:a1]).to eq "x"
      expect(result[:b1]).to eq "o"
      expect(result[:c1]).to eq "x"
      expect(result[next_move.position.to_sym]).to eq next_move.value
    end
  end

  describe "game_over?" do
    it "calls 'winning_combo?' on a board_setup" do
      engine = Engine.new
      board_setup = BoardSetup.create
      expect_any_instance_of(BoardSetup).to receive(:winning_combo?)
      engine.game_over?(board_setup)
    end

    context "when there is no winning combo" do
      it "calls 'positions_full?' on a board_setup" do
        engine = Engine.new
        board_setup = BoardSetup.create

        allow_any_instance_of(BoardSetup).to receive(:winning_combo?)
          .and_return(false)

        expect_any_instance_of(BoardSetup).to receive(:positions_full?)
        engine.game_over?(board_setup)
      end
    end
  end
end
