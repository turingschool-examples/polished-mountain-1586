require 'rails_helper'

RSpec.describe "Experiments index page" do
  describe 'US3' do
    it 'Displays all experiments longer than 6 months in descending num_months length' do
      lab = Lab.create!(name: 'Science Lab')
      scientist1 = lab.scientists.create!(name: 'Nico', specialty: 'Science', university: 'Hard knocks')
      experiment1 = Experiment.create!(name: 'Something weird', objective: 'Create wierdness', num_months: 9)
      experiment2 = Experiment.create!(name: 'Something very weird', objective: 'Create super wierdness', num_months: 3)
      experiment3 = Experiment.create!(name: 'A little too weird', objective: 'Take some weird out', num_months: 11)
      experiment4 = Experiment.create!(name: 'Cannot stop weird', objective: 'Just let the weird happen', num_months: 15)
      # When I visit the experiment index page
      visit experiments_path
      # I see the names of all long running experiments (longer than 6 months),
      # And I see the names are in descending order (longest to shortest)
      expect(experiment4.name).to appear_before(experiment3.name)
      expect(experiment3.name).to appear_before(experiment1.name)
      expect(page).to_not have_content(experiment2.name)
    end
  end
end