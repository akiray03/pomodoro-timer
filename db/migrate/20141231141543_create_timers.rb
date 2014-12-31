class CreateTimers < ActiveRecord::Migration
  def change
    create_table :timers do |t|
      t.integer :room_id
      t.integer :timer
      t.datetime :started_at
      t.text :comment

      t.timestamps null: false
    end
  end
end
