class AddBoardSetupGames < ActiveRecord::Migration[5.0]
  def change
    create_table :board_setup_games do |t|
      t.integer :board_setup_id
      t.integer :game_id
    end
  end
end
