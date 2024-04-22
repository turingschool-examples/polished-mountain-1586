class Experiment < ApplicationRecord
has_many :scientist_experiements
has_many :scientists, through: :scientist_experiements
end