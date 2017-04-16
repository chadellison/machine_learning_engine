class Engine
  def train(number)
    number.times do
      play_self
    end
  end

  def play_self
    game = Game.create
    board_setup = new_game(game)

    until game_over?(board_setup) do
      board_setup = make_move(board_setup)
    end

    winner = board_setup.find_winner
    game.update_rankings(winner)
  end

  def new_game(game)
    game.board_setups.find_or_create_by(BoardSetup.new.positions)
  end

  def make_move(board_setup)
    rank = board_setup.next_moves.max_by(&:rank).rank

    next_move = board_setup.next_moves.where(rank: rank).sample
    board_setup.update(chosen_move_id: next_move.id)

    new_setup = BoardSetup.find_or_create_by(new_positions(board_setup, next_move))
    new_setup
  end

  def game_over?(board_setup)
    board_setup.winning_combo? || board_setup.positions_full?
  end

  def new_positions(board_setup, next_move)
    positions = board_setup.find_current_positions
    positions[next_move.position.to_sym] = next_move.value
    positions
  end
end
