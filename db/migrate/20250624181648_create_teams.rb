class CreateTeams < ActiveRecord::Migration[8.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :points, null: false, default: 0

      t.timestamps
    end
  end
end
