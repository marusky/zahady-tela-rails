class Current < ActiveSupport::CurrentAttributes
  attribute :player, :admin
  
  def question
    Game.take.question
  end
end