class AddCurrentMoveToBoardSetup < ActiveRecord::Migration[5.0]
  def change
    add_column :board_setups, :chosen_move_id, :integer
  end
end
