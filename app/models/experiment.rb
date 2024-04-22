class Experiment < ApplicationRecord
  has_many :scientist_experiments
  has_many :scientists, through: :scientist_experiments

  def scientist_experiment(scientist)
    scientist_experiments.where("scientist_id = ?", scientist.id)[0]
  end
end
