class FixTypeColumnGames < ActiveRecord::Migration
  def change
    rename_column :users, :type, :whatgame
  end
end
