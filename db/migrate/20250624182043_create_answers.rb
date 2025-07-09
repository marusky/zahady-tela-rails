class CreateAnswers < ActiveRecord::Migration[8.0]
  def change
    create_table :answers do |t|
      t.references :player, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.string :answer
      t.boolean :is_correct

      t.timestamps
    end
  end
end
