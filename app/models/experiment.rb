class Experiment < ApplicationRecord
has_many :scientist_experiements, dependent: :destroy
has_many :scientists, through: :scientist_experiements
end