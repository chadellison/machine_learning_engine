class AddValueToNextMove < ActiveRecord::Migration[5.0]
  def change
    add_column :next_moves, :value, :string
  end
end
