require 'rails_helper'

RSpec.describe 'Experiments Index Page' do
  describe 'User Story 3' do
    it 'lists the names of all long running experiments (longer than 6 months), and I see the names are in descending order (longest to shorter)' do
      experiment1 = Experiment.create!(name: 'Experiment 1', objective: 'Objective 1', num_months: 99)
      experiment2 = Experiment.create!(name: 'Experiment 2', objective: 'Objective 2', num_months: 3)
      experiment3 = Experiment.create!(name: 'Experiment 3', objective: 'Objective 3', num_months: 45)
      experiment4 = Experiment.create!(name: 'Experiment 4', objective: 'Objective 4', num_months: 6)
      experiment5 = Experiment.create!(name: 'Experiment 5', objective: 'Objective 5', num_months: 53)

      visit experiments_path

      within '#long_running_experiments' do
        expect(experiment1.name).to appear_before(experiment5.name)
        expect(experiment5.name).to appear_before(experiment3.name)

        expect(page).to_not have_content(experiment2.name)
        expect(page).to_not have_content(experiment4.name)
      end
    end
  end
end
