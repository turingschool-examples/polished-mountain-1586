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

  describe 'US 2' do
    it 'Can remove an experiment from a scientist' do
      lab = Lab.create!(name: 'Science Lab')
      
      scientist1 = lab.scientists.create!(name: 'Nico', specialty: 'Science', university: 'Hard knocks')
      scientist2 = lab.scientists.create!(name: 'Wolf', specialty: 'Baby science', university: 'Momma and Dadda')
      
      experiment1 = Experiment.create!(name: 'Something weird', objective: 'Create wierdness', num_months: 9)
      experiment2 = Experiment.create!(name: 'Something very weird', objective: 'Create super wierdness', num_months: 3)
      
      scientist1_experiment1 = ScientistExperiement.create!(scientist_id: scientist1.id, experiment_id: experiment1.id)
      scientist1_experiment2 = ScientistExperiement.create!(scientist_id: scientist1.id, experiment_id: experiment2.id)
      scientist2_experiment1 = ScientistExperiement.create!(scientist_id: scientist2.id, experiment_id: experiment1.id)
      # As a visitor
      # When I visit a scientist's show page
      visit scientist_path(scientist1)
      within '.experiments' do
        # Then next to each experiment's name, I see a button to remove that experiment from that scientist's work load
        expect(page).to have_button("Delete #{experiment1.name}")
        expect(page).to have_button("Delete #{experiment2.name}")
        # When I click that button for one experiment
        click_button("Delete #{experiment1.name}")
      end
      # I'm brought back to the scientist's show page
      expect(current_path).to eq(scientist_path(scientist1))
      # And I no longer see that experiment's name listed
      within '.experiments' do
        # Then next to each experiment's name, I see a button to remove that experiment from that scientist's work load
        expect(page).to_not have_button("Delete #{experiment1.name}")
        expect(page).to have_button("Delete #{experiment2.name}")
        # When I click that button for one experiment
      end
      # And when I visit a different scientist's show page that is working on that same experiment,
      visit scientist_path(scientist2)
      # Then I see that the experiment is still on the other scientist's work load
      within '.experiments' do
        expect(page).to_not have_button("Delete #{experiment1.name}")
      end
    end
  end
end