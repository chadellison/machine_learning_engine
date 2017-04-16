class DefaultRank < ActiveRecord::Migration[5.0]
  def change
    remove_column :next_moves, :rank
    add_column :next_moves, :rank, :integer, default: 0
  end
end
