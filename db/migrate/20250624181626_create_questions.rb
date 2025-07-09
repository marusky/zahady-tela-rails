class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.string :text
      t.integer :state, null: false, default: 0
      t.boolean :is_fact, null: false

      t.timestamps
    end

    add_reference :questions, :game, foreign_key: true
  end
end
