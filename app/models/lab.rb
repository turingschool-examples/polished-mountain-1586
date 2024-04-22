class Lab < ApplicationRecord
  has_many :scientists

  def scientists_with_experiment_counts
    scientists.joins(:experiments)
      .select('scientists.*, COUNT(experiments.id) AS experiment_count')
      .group('scientists.id')
      .order('experiment_count DESC')
  end
end