class BoardSetup < ApplicationRecord
  has_many :next_moves
  has_many :board_setup_games
  has_many :games, through: :board_setup_games

  # def winning_combo?
  # end
  #
  # def find_winner
  #
  # end
end
