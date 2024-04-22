class Experiment < ApplicationRecord
  has_many :experiment_scientists
  has_many :scientists, through: :experiment_scientists

  def self.long_running_experiments
    where('num_months > ?', 6).order(num_months: :desc)
  end
end