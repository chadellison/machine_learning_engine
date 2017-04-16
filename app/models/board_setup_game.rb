class BoardSetupGame < ApplicationRecord
  belongs_to :board_setup
  belongs_to :game
end
