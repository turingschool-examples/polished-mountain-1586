class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :scientist_experiements
  has_many :experiments, through: :scientist_experiements
end