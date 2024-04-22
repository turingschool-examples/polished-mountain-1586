class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :scientist_experiments, dependent: :destroy
  has_many :experiments, through: :scientist_experiments
end