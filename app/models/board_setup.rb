class BoardSetup < ApplicationRecord
  has_many :next_moves
  has_many :board_setup_games
  has_many :games, through: :board_setup_games
  before_commit :find_next_moves

  def winning_combo?
    winning_combos.any? do |combo|
      combo.all? { |value| value == "x" } ||
      combo.all? { |value| value == "o" }
    end
  end

  def winning_combos
    [
      [a1, a2, a3], [b1, b2, b3], [c1, c2, c3], [a1, b1, c1], [a2, b2, c2],
      [a3, b3, c3], [a1, b2, c3], [a3, b2, c1]
    ]
  end

  def find_winner
    winner = winning_combos.detect do |combo|
      combo.all? { |value| value == "x" } ||
      combo.all? { |value| value == "o" }
    end
    winner = winner.sample if winner.present?
    winner
  end

  def find_next_moves
    find_current_positions.each do |position, value|
      if value.nil?
        next_moves.find_or_create_by(position: position.to_s,
                                     value: find_current_value)
      end
    end
  end

  def find_current_value
    x_count = find_current_positions.values.select { |value| value == "x" }.size
    o_count = find_current_positions.values.select { |value| value == "o" }.size

    if x_count > o_count
      "o"
    else
      "x"
    end
  end

  def find_current_positions
    { a1: a1, a2: a2, a3: a3, b1: b1, b2: b2, b3: b3, c1: c1, c2: c2,
      c3: c3 }
  end

  def positions
    { a1: nil, a2: nil, a3: nil, b1: nil, b2: nil, b3: nil, c1: nil, c2: nil,
      c3: nil }
  end

  def positions_full?
    find_current_positions.values.all?(&:present?)
  end
end
