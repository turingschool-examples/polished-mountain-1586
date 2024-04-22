class Experiment < ApplicationRecord
  has_many :science_experiments
  has_many :scientists, through: :science_experiments
end