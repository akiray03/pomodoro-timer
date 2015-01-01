class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :token
      t.text :config

      t.timestamps null: false
    end
  end
end
