class Game < ApplicationRecord
  has_many :board_setup_games
  has_many :board_setups, through: :board_setup_games

  def update_rankings(winner)
    return nil if winner.nil?
    move_ids = board_setups.pluck(:chosen_move_id)

    NextMove.where(id: move_ids).each do |move|
      if move.value == winner
        move.increment!(:rank)
      else
        move.decrement!(:rank)
      end
    end
  end
end
