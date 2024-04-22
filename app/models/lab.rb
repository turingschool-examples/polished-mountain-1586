class Lab < ApplicationRecord
  has_many :scientists

  def self.scientists_with_experiments
    joins(scientists: :scientist_experiments)
      .select("scientists.name, scientist_experiments.scientist_id AS sci_id, COUNT(scientist_experiments.scientist_id) AS experiment_count")
      .group("scientists.name, scientist_experiments.scientist_id")
      .order("experiment_count DESC")
  end
end
