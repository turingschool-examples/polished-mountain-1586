class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :science_experiments
  has_many :experiments, through: :science_experiments
end