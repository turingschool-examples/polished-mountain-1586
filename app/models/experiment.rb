class Experiment < ApplicationRecord
  has_many :scientist_experiments
  has_many :scientists, through: :scientist_experiments

  def scientist_experiment(scientist)
    scientist_experiments.where("scientist_id = ?", scientist.id)[0]
  end

  def self.long_running_experiments
    where("experiments.num_months > 6").order("experiments.num_months DESC")
  end
end
