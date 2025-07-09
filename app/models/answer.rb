class Answer < ApplicationRecord
  belongs_to :player, default: -> { Current.player }
  belongs_to :question

  validates :answer, presence: true

  scope :correct, -> { where(is_correct: true) }
  scope :for_team, -> (team_id) { joins(:player).where(player: { team_id: team_id } ) }

  before_create :evaluate_answer

  def answered?
    answer.present?
  end

  def fact?
    answer == "fact"
  end

  def myth?
    answer == "myth"
  end

  private
    def evaluate_answer
      self.is_correct = correct_answer?
    end

    def correct_answer?
      question.is_fact == fact?
    end
end
