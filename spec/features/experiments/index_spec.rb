require 'rails_helper'

RSpec.describe "Experiment Index Page" do
  before :each do
    @lab = Lab.create!(name: 'Cool Lab')

    @marie_curie = Scientist.create!(name: 'Marie Curie', specialty: 'Radioactivity', university: 'University of Paris', lab: @lab)
    @richard_feynman = Scientist.create!(name: 'Richard Feynman', specialty: 'Theoretical Physics', university: 'Princeton University', lab: @lab)
    @isaac_newton = Scientist.create!(name: 'Isaac Newton', specialty: 'Physics and Mathematics', university: 'University of Cambridge', lab: @lab)

    @minerva = Experiment.create!(name: 'MINERvA', objective: 'Study neutrino reactions with five different nuclei', num_months: 4)
    @double_helix = Experiment.create!(name: 'Double Helix', objective: 'Study DNA structure', num_months: 10)
    @laws_of_motion = Experiment.create!(name: 'The Laws of Motion', objective: 'Explore laws of motion and gravitation', num_months: 8)

    ScientistExperiment.create!(scientist: @marie_curie, experiment: @minerva)
    ScientistExperiment.create!(scientist: @richard_feynman, experiment: @minerva)
    ScientistExperiment.create!(scientist: @richard_feynman, experiment: @double_helix)
    ScientistExperiment.create!(scientist: @isaac_newton, experiment: @double_helix)
    ScientistExperiment.create!(scientist: @isaac_newton, experiment: @laws_of_motion)
    ScientistExperiment.create!(scientist: @marie_curie, experiment: @laws_of_motion)
  end

  describe 'User story 3' do
    it 'lists all the experiments' do
      visit experiments_path

      expect(page).to have_content(@minerva.name)
      expect(page).to have_content(@double_helix.name)
      expect(page).to have_content(@laws_of_motion.name)
    end

    it 'sorts the experiments by those longer than 6 months by name length descending' do
      visit experiments_path

      within "#sorted-experiments" do
        expect(@laws_of_motion.name).to appear_before(@double_helix.name)
        expect(@double_helix.name).to_not appear_before(@laws_of_motion.name)
        expect(page).to_not have_content(@minerva.name)
      end
    end
  end
end