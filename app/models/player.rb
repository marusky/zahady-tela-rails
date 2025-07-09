class Player < ApplicationRecord
  belongs_to :team, touch: true
  has_many :answers

  validates :name, presence: true

  def correct_answers
    answers.correct.count
  end
end
