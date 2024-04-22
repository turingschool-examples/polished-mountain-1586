class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :scientist_experiments
  has_many :experiments, through: :scientist_experiments

  def experiments_count
    self.experiments.count
  end

  def self.order_by_experiments
    self.joins(:experiments)
        .select('scientists.*, count(scientist_experiments.experiment_id) as experiment_count')
        .group('scientists.id')
        .order('experiment_count DESC')
  end
end