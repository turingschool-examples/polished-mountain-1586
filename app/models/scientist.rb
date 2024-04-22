class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :experiment_scientists
  has_many :experiments, through: :experiment_scientists

  def self.most_to_least_experiments
    joins(:experiments).select('scientists.*, COUNT(*) AS experiment_count').group(:id).order('experiment_count DESC')
  end
end