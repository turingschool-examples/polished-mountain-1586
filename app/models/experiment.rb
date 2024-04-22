class Experiment < ApplicationRecord
  has_many :scientist_experiments
  has_many :scientists, through: :scientist_experiments


  # names of all long running experiments (longer than 6 months),
  def self.long_running_experiments
    where('num_months > ?', 6)
  end

  # names are in descending order (longest to shortest)
  def self.names_in_descending_order
    order('LENGTH(name) DESC').pluck(:name)
  end
end
