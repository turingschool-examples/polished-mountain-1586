class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :experiment_scientists
  has_many :experiments, through: :experiment_scientists
end