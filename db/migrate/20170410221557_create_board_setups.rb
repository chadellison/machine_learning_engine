class CreateBoardSetups < ActiveRecord::Migration[5.0]
  def change
    create_table :board_setups do |t|
      t.string :a1
      t.string :b1
      t.string :c1
      t.string :a2
      t.string :b2
      t.string :c2
      t.string :a3
      t.string :b3
      t.string :c3
      t.timestamps
    end
  end
end
