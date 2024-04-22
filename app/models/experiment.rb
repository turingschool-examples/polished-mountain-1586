class Experiment < ApplicationRecord
  has_many :scientist_experiments
  has_many :scientists, through: :scientist_experiments


# names of all long running experiments (longer than 6 months),
  def long_running_experiments

  end

  # names are in descending order (longest to shortest)
  def names_in_descending_order

  end
end
