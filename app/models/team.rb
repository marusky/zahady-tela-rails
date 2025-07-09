class Team < ApplicationRecord
  has_many :players

  broadcasts_refreshes

  def add_points(added_points)
    update(points: points + added_points)
  end
end
