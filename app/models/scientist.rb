class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :scientist_experiments
  has_many :experiments, through: :scientist_experiments

  def self.experiments_ordered
    require 'pry' ; binding.pry
    
  end

  # def num_experiments
  #   require 'pry' ; binding.pry
  # end
end