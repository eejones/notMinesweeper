class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :user
      t.boolean :winner
      t.integer :tottime
      t.datetime :playat
      t.integer :type, default: 1

      t.timestamps
    end
    add_index :games, :user_id
  end
end
