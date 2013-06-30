class FixTypeColumnUsers < ActiveRecord::Migration
  def change
    rename_column :games, :type, :whatgame
  end
end
