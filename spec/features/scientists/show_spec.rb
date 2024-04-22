require 'rails_helper'

RSpec.describe "Scientist show page" do
  describe 'US1' do
    it 'Displays all scientists information: name, speciality, university' do
      lab = Lab.create!(name: 'Science Lab')
      scientist1 = lab.scientists.create!(name: 'Nico', specialty: 'Science', university: 'Hard knocks')
      experiment1 = Experiment.create!(name: 'Something weird', objective: 'Create wierdness', num_months: 9)
      experiment2 = Experiment.create!(name: 'Something very weird', objective: 'Create super wierdness', num_months: 3)
      scientist1_experiment1 = ScientistExperiement.create!(scientist_id: scientist1.id, experiment_id: experiment1.id)
      scientist1_experiment2 = ScientistExperiement.create!(scientist_id: scientist1.id, experiment_id: experiment2.id)
      # require 'pry'; binding.pry
      # As a visitor
      # When I visit a scientist's show page
      visit scientist_path(scientist1)
      # I see all of that scientist's information including:
      #  - name
      expect(page).to have_content("Scientist #{scientist1.name}")
      #  - specialty
      expect(page).to have_content("Specialty: #{scientist1.specialty}")
      #  - university where they got their degree
      expect(page).to have_content("University: #{scientist1.university}")
      # And I see the name of the lab where this scientist works
      expect(page).to have_content("Lab working at: #{scientist1.lab.name}")
      # And I see the names of all of the experiments this scientist is running
      within '.experiments' do
        expect(page).to have_content("Experiment: #{scientist1.experiments.first.name}")
        expect(page).to have_content("Experiment: #{scientist1.experiments.second.name}")
      end
    end
  end
end