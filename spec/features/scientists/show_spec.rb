require 'rails_helper'

RSpec.describe 'Scientist Show Page' do
  describe 'User Story 1' do
    it 'shows the scientists name, specialty, and university. I also see the name of the lab where this scientists works and all of the experiments this scientist is running' do
      lab1 = Lab.create!(name: 'Lab 1')
      lab2 = Lab.create!(name: 'Lab 2')

      scientist1 = Scientist.create!(name: 'Abdul', specialty: 'Creating monstrously good YouTube videos', university: 'University 1', lab: lab1)

      experiment1 = Experiment.create!(name: 'Experiment 1', objective: 'Objective 1', num_months: 99)
      experiment2 = Experiment.create!(name: 'Experiment 2', objective: 'Objective 2', num_months: 3)
      experiment3 = Experiment.create!(name: 'Experiment 3', objective: 'Objective 3', num_months: 45)

      exp_sci1 = ExperimentScientist.create!(experiment: experiment1, scientist: scientist1)
      exp_sci2 = ExperimentScientist.create!(experiment: experiment3, scientist: scientist1)

      visit scientist_path(scientist1)

      expect(page).to have_content('Abdul')
      expect(page).to have_content('Specialty: Creating monstrously good YouTube videos')
      expect(page).to have_content('University: University 1')
      expect(page).to have_content('Lab: Lab 1')

      expect(page).to_not have_content('Lab: Lab 2')

      within '#scientist_experiments' do
        expect(page).to have_content('Experiment 1')
        expect(page).to have_content('Experiment 3')

        expect(page).to_not have_content('Experiment 2')
      end
    end
  end

  describe 'User Story 2' do
    it 'next to each experiments name, I see a button to remove that experiment from that scientists workload. when i click that button for one experiment, Im brought back to the scientist show page and no longer see that experiment, and when I visit a different scientists show page that is working on that same experiment, it is still listed' do
      lab1 = Lab.create!(name: 'Lab 1')
      lab2 = Lab.create!(name: 'Lab 2')

      scientist1 = Scientist.create!(name: 'Abdul', specialty: 'Creating monstrously good YouTube videos', university: 'University 1', lab: lab1)
      scientist2 = Scientist.create!(name: 'Chris', specialty: 'Creating sick music', university: 'Another University', lab: lab1)

      experiment1 = Experiment.create!(name: 'Experiment 1', objective: 'Objective 1', num_months: 99)
      experiment2 = Experiment.create!(name: 'Experiment 2', objective: 'Objective 2', num_months: 3)
      experiment3 = Experiment.create!(name: 'Experiment 3', objective: 'Objective 3', num_months: 45)

      exp_sci1 = ExperimentScientist.create!(experiment: experiment1, scientist: scientist1)
      exp_sci2 = ExperimentScientist.create!(experiment: experiment3, scientist: scientist1)
      exp_sci3 = ExperimentScientist.create!(experiment: experiment3, scientist: scientist2)

      visit scientist_path(scientist1)

      within '#scientist_experiments' do
        expect(page).to have_content('Experiment 1')
        expect(page).to have_content('Experiment 3')
      end

      visit scientist_path(scientist2)

      within '#scientist_experiments' do
        expect(page).to have_content('Experiment 3')

        within "#experiment_#{experiment3.id}" do
          expect(page).to have_button('Remove')

          click_button('Remove')
        end

        expect(current_path).to eq(scientist_path(scientist2))

        expect(page).to_not have_content('Experiment 3')
      end

      visit scientist_path(scientist1)

      within '#scientist_experiments' do
        expect(page).to have_content('Experiment 1')
        expect(page).to have_content('Experiment 3')
      end
    end
  end
end
