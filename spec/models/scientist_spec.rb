require 'rails_helper'

RSpec.describe Scientist do
  it {should belong_to :lab}
  it { should have_many(:experiment_scientists) }
  it { should have_many(:experiments).through(:experiment_scientists) }

  describe '.Class Methods' do
    describe '.most_to_least_experiments' do
      it 'returns a list of scientists ordered by most to least experimens and has access to their count of experiments' do
        lab1 = Lab.create!(name: 'Lab 1')
  
        scientist1 = Scientist.create!(name: 'Abdul', specialty: 'Creating monstrously good YouTube videos', university: 'University 1', lab: lab1)
        scientist2 = Scientist.create!(name: 'Chris', specialty: 'Creating sick music', university: 'Another University', lab: lab1)
        scientist3 = Scientist.create!(name: 'Scientist 3', specialty: 'Speciality 3', university: 'University 3', lab: lab1)
        scientist4 = Scientist.create!(name: 'Scientist 4', specialty: 'Speciality 4', university: 'University 4', lab: lab1)
        scientist5 = Scientist.create!(name: 'Scientist 5', specialty: 'Speciality 5', university: 'University 5', lab: lab1)
  
        experiment1 = Experiment.create!(name: 'Experiment 1', objective: 'Objective 1', num_months: 99)
        experiment2 = Experiment.create!(name: 'Experiment 2', objective: 'Objective 2', num_months: 3)
        experiment3 = Experiment.create!(name: 'Experiment 3', objective: 'Objective 3', num_months: 45)
        experiment4 = Experiment.create!(name: 'Experiment 4', objective: 'Objective 4', num_months: 13)
        experiment5 = Experiment.create!(name: 'Experiment 5', objective: 'Objective 5', num_months: 1)
  
        exp_sci1 = ExperimentScientist.create!(experiment: experiment1, scientist: scientist1)
        exp_sci2 = ExperimentScientist.create!(experiment: experiment3, scientist: scientist1)

        exp_sci3 = ExperimentScientist.create!(experiment: experiment3, scientist: scientist2)

        exp_sci4 = ExperimentScientist.create!(experiment: experiment3, scientist: scientist3)
        exp_sci5 = ExperimentScientist.create!(experiment: experiment1, scientist: scientist3)
        exp_sci6 = ExperimentScientist.create!(experiment: experiment2, scientist: scientist3)
        exp_sci7 = ExperimentScientist.create!(experiment: experiment4, scientist: scientist3)

        exp_sci8 = ExperimentScientist.create!(experiment: experiment4, scientist: scientist4)
        exp_sci9 = ExperimentScientist.create!(experiment: experiment1, scientist: scientist4)
        exp_sci10 = ExperimentScientist.create!(experiment: experiment2, scientist: scientist4)

        exp_sci11 = ExperimentScientist.create!(experiment: experiment1, scientist: scientist5)
        exp_sci12 = ExperimentScientist.create!(experiment: experiment2, scientist: scientist5)
        exp_sci13 = ExperimentScientist.create!(experiment: experiment3, scientist: scientist5)
        exp_sci14 = ExperimentScientist.create!(experiment: experiment4, scientist: scientist5)
        exp_sci15 = ExperimentScientist.create!(experiment: experiment5, scientist: scientist5)

        scientist_list = Scientist.most_to_least_experiments

        expect(scientist_list).to eq([scientist5, scientist3, scientist4, scientist1, scientist2])

        expect(scientist_list.first.experiment_count).to eq(5)
        expect(scientist_list.third.experiment_count).to eq(3)
      end
    end
  end
end