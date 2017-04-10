class CreateNextMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :next_moves do |t|
      t.integer :rank
      t.integer :board_setup_id
      t.string :position
      t.timestamps
    end
  end
end
