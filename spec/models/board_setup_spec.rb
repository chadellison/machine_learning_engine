require 'rails_helper'

RSpec.describe BoardSetup, type: :model do
  it "has many 'next_moves'" do
    expect(BoardSetup.new).to respond_to(:next_moves)
  end

  it "has many board_setup_games" do
    expect(BoardSetup.new).to respond_to(:board_setup_games)
  end

  it "has many games" do
    expect(BoardSetup.new).to respond_to(:games)
  end

  describe "find_next_moves" do
    it "creates a next_move record for every position that is empty" do
      board_setup = BoardSetup.create(a1: "x", b1: "o", c3: "x", b3: "o")
      board_setup.find_next_moves
      expect(board_setup.next_moves.count).to eq 5

      positions = ["a2", "a3", "b2", "c1", "c2"]
      expect(board_setup.next_moves.pluck(:position)).to eq positions
    end
  end

  describe "find_current_positions" do
    it "returns a hash of all moves on a board" do
      board_setup = BoardSetup.create(a1: "x", b1: "o", c1: "o", a2: "x", b2: "o", c3: "x", b3: "o")

      result = { a1: "x", b1: "o", c1: "o", a2: "x", b2: "o", c2: nil, a3: nil, c3: "x", b3: "o" }

      expect(board_setup.find_current_positions).to eq result
    end
  end

  describe "find_current_value" do
    context "when it is x's turn" do
      it "returns 'x'" do
        board_setup = BoardSetup.create(a1: "x", b1: "o")
        expect(board_setup.find_current_value).to eq "x"
      end
    end

    context "when it is o's turn" do
      it "returns 'o'" do
        board_setup = BoardSetup.create(a1: "x", b1: "o", c1: "x")
        expect(board_setup.find_current_value).to eq "o"
      end
    end
  end

  describe "positons" do
    it "returns a hash of a blank board" do
      result = { a1: nil, a2: nil, a3: nil, b1: nil, b2: nil, b3: nil,
        c1: nil, c2: nil, c3: nil }

      expect(BoardSetup.new.positions).to eq result
    end
  end

  describe "winning_combo?" do
    context "when a board has a winning combo" do
      context "of 'x's " do
        it "returns true" do
          board_setup = BoardSetup.create(a1: "x", b1: "x", c1: "x")
          expect(board_setup.winning_combo?).to be true
        end
      end

      context "of 'o's " do
        it "returns true" do
          board_setup = BoardSetup.create(a1: "o", b1: "o", c1: "o")
          expect(board_setup.winning_combo?).to be true
        end
      end
    end

    context "when a board does not have a winning combo" do
      it "returns false" do
        expect(BoardSetup.create.winning_combo?).to be false
      end
    end
  end

  describe "winning_combos" do
    it "returns an array of all of a board's winning_combos" do
      board_setup = BoardSetup.create
      result = [
        [board_setup.a1, board_setup.a2, board_setup.a3],
        [board_setup.b1, board_setup.b2, board_setup.b3],
        [board_setup.c1, board_setup.c2, board_setup.c3],
        [board_setup.a1, board_setup.b1, board_setup.c1],
        [board_setup.a2, board_setup.b2, board_setup.c2],
        [board_setup.a3, board_setup.b3, board_setup.c3],
        [board_setup.a1, board_setup.b2, board_setup.c3],
        [board_setup.a3, board_setup.b2, board_setup.c1]
      ]
      expect(board_setup.winning_combos).to eq result
    end
  end

  describe "find_winner" do
    context "when there is a winner" do
      context "when the winner is 'x'" do
        it "returns 'x'" do
          board_setup = BoardSetup.create(a2: "x", b2: "x", c2: "x")
          expect(board_setup.find_winner).to eq "x"
        end
      end

      context "when the winner is 'o'" do
        it "returns 'o'" do
          board_setup = BoardSetup.create(a1: "o", b2: "o", c3: "o")
          expect(board_setup.find_winner).to eq "o"
        end
      end
    end

    context "when there is no winner" do
      it "returns nil" do
        expect(BoardSetup.create.find_winner).to be_nil
      end
    end
  end

  describe "positions_full?" do
    context "when the positions are full" do
      it "returns true" do
        board_setup = BoardSetup.create(a1: "x", a2: "o", a3: "x", b1: "o",
                                        b2: "x", b3: "x", c1: "o", c2: "x",
                                        c3: "o")

        expect(board_setup.positions_full?).to be true
      end
    end

    context "when the positions are not full" do
      it "returns false" do
        board_setup = BoardSetup.create(a1: "x", a2: "o", a3: "x", b1: "o",
                                        b2: "x", b3: "x", c1: "o", c2: "x",
                                        c3: nil)

        expect(board_setup.positions_full?).to be false
      end
    end
  end
end
