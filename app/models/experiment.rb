class Experiment < ApplicationRecord
  has_many :scientist_experiments
  has_many :scientists, through: :scientist_experiments

  def scientist_experiment(scientist)
    scientist_experiments.find_by("scientist_id": scientist.id)
  end

  def self.long_running_experiments
    where("num_months > 6").order("num_months DESC")
  end
end
