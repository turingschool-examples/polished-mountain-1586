require 'rails_helper'

RSpec.describe ExperimentScientist do
  it { should belong_to(:scientist) }
  it { should belong_to(:experiment) }
end