class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :token
      t.string :timer
      t.datetime :started_at

      t.timestamps null: false
    end

    add_index :rooms, :token, unique: true
  end
end
