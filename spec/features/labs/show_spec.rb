require 'rails_helper'

RSpec.describe 'Lab Show Page' do
  describe 'Extension Story 1' do
    it 'shows the labs name and the names of all scientists that work at this lab and next to each scientist I see the number of experiments associated with that scientist, and I see hte list of scientists is ordered from most number of experiments to least number of experiments' do
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

      lab2 = Lab.create!(name: 'Lab 2')
      scientist6 = Scientist.create!(name: 'Scientist 6', specialty: 'Speciality 6', university: 'University 1', lab: lab2)
      exp_sci16 = ExperimentScientist.create!(experiment: experiment1, scientist: scientist6)

      visit lab_path(lab1)

      expect(page).to have_content('Lab 1')

      within '#lab_scientists' do
        expect('Scientist 5 - 5 Experiments').to appear_before('Scientist 3 - 4 Experiments')
        expect('Scientist 3 - 4 Experiments').to appear_before('Scientist 4 - 3 Experiments')
        expect('Scientist 4 - 3 Experiments').to appear_before('Abdul - 2 Experiments')
        expect('Abdul - 2 Experiments').to appear_before('Chris - 1 Experiments')

        expect(page).to_not have_content('Scientist 6')
      end
    end
  end
end
