class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.boolean :winner
      t.integer :tottime
      t.datetime :creation
      t.integer :type

      t.timestamps
    end
  end
end
