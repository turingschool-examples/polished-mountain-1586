class Experiment < ApplicationRecord
  has_many :experiment_scientists
  has_many :scientists, through: :experiment_scientists
end