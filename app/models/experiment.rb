class Experiment < ApplicationRecord
  validates_presence_of :name,
                        :objective,
                        :num_months

  has_many :experiment_scientists
  has_many :scientists, through: :experiment_scientists

  def self.long_running_experiments_in_descending_order
    where("num_months > 6").order(num_months: :desc).pluck(:name)
  end
end