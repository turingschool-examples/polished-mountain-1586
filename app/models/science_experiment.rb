class ScienceExperiment < ApplicationRecord
  belongs_to :scientist
  belongs_to :experiment
end