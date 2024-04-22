require 'rails_helper'

RSpec.describe Experiment do
  it { should have_many(:experiment_scientists) }
  it { should have_many(:scientists).through(:experiment_scientists) }

  describe '.Class Methods' do
    describe '.long_running_experiments' do
      it 'returns a list of experiments running longer than 6 months sorted by longest to shortest' do
        experiment1 = Experiment.create!(name: 'Experiment 1', objective: 'Objective 1', num_months: 99)
        experiment2 = Experiment.create!(name: 'Experiment 2', objective: 'Objective 2', num_months: 3)
        experiment3 = Experiment.create!(name: 'Experiment 3', objective: 'Objective 3', num_months: 45)
        experiment4 = Experiment.create!(name: 'Experiment 4', objective: 'Objective 4', num_months: 6)
        experiment5 = Experiment.create!(name: 'Experiment 5', objective: 'Objective 5', num_months: 53)

        expect(Experiment.long_running_experiments).to eq([experiment1, experiment5, experiment3])
      end
    end
  end
end