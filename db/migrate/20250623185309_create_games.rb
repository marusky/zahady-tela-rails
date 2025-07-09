class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.integer :state, null: false, default: 0

      t.timestamps
    end
  end
end
