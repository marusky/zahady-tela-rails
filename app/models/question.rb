class Question < ApplicationRecord
  belongs_to :game, optional: true, touch: true
  has_many :answers

  validates :text, presence: true

  after_update :schedule_closing, if: :question_opened?
  after_update :add_points_to_teams, if: :question_evaluated?

  enum :state, {
    prepared: 0,
    open: 1,
    closed: 2,
    evaluated: 3,
  }, default: :prepared

  def correct_answers_count_for_team(team_id)
    answers.for_team(team_id).correct.count
  end

  private
    def schedule_closing
      QuestionCloserJob.set(wait: 20).perform_later(self)
    end

    def question_opened?
      saved_change_to_state && open?
    end

    def add_points_to_teams
      team_1, team_2 = Team.order(:id)

      team_1.add_points(correct_answers_count_for_team(team_1.id))
      team_2.add_points(correct_answers_count_for_team(team_2.id))
    end

    def question_evaluated?
      saved_change_to_state && evaluated?
    end
end
