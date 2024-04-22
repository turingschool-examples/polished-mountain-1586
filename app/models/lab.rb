class Lab < ApplicationRecord
  has_many :scientists
  has_many :experiments, through: :scientist_experiements
end