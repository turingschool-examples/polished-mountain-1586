class Experiment < ApplicationRecord
  has_many :scientist_experiments
  has_many :scientists, through: :scientist_experiments

  def self.order_by_num_months
    self.order(num_months: :desc)
  end

  def self.long_running_experiments
    self.where("num_months > 6")
  end
end