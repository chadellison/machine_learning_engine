class Engine
  # def train(number)
  # number = 1000 if number > 1000
  #   number.times do
  #     play_self
  #   end
  # end
  #
  # def play_self
  #   game = Game.create
  #   board_setup = new_game(game)
  #
  #   until game_over?(board_setup) do
  #     board_setup = board_setup.make_move(board_setup)
  #   end
  #
  #   winner = board_setup.find_winner
  #   game.update_rankings(winner)
  # end
  #
  # def new_game(game)
  #   game.board_setups.find_or_create_by(blank_board)
  # end
  #
  # def make_move(board_setup)
  #   rank = board_setup.next_moves.max_by(&:rank)
  #   next_move = board_setup.next_moves.where(rank: rank).sample
  #   board_setup.update(chosen_move_id: next_move.id)
  #   new_setup = BoardSetup.find_or_create_by(next_move.position.to_sym => next_move.value)
  #   new_setup
  # end
  #
  # def game_over?(board_setup)
  #   board_setup.positions_full? || board_setup.winning_combo?
  # end
  #
  # def blank_board
  #   { a1: nil, a2: nil, a3: nil, b1: nil, b2: nil, b3: nil, c1: nil, c2: nil,
  #     c3: nil }
  # end
end
