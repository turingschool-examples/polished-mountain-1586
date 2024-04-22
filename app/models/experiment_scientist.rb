class ExperimentScientist < ApplicationRecord
  belongs_to :scientist
  belongs_to :experiment
end