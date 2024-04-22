require 'rails_helper'

Rspec.describe 'Scientist Show Pg' do
  before :each do
    @lab = Lab.create(name: 'Fermilab')

    @marie_curie = Scientist.create(name: 'Marie Curie', specialty: 'Radioactivity', university: 'University of Paris', lab: @lab)
    @richard_feynman = Scientist.create(name: 'Richard Feynman', specialty: 'Theoretical Physics', university: 'Princeton University', lab: @lab)
    @isaac_newton = Scientist.create(name: 'Isaac Newton', specialty: 'Physics and Mathematics', university: 'University of Cambridge', lab: @lab)

    @minerva = Experiment.create(name: 'MINERvA', objective: 'Study neutrino reactions with five different nuclei', num_months: 4)
    @double_helix = Experiment.create(name: 'Double Helix', objective: 'Study DNA structure', num_months: 6)
    @laws_of_motion = Experiment.create(name: 'Laws of Motion', objective: 'Explore laws of motion and gravitation', num_months: 8)

    # MINERvA experiment
    ScientistExperiment.create(scientist: @marie_curie, experiment: @minerva)
    ScientistExperiment.create(scientist: @richard_feynman, experiment: @minerva)

    # Double Helix experiment
    ScientistExperiment.create(scientist: @richard_feynman, experiment: @double_helix)
    ScientistExperiment.create(scientist: @isaac_newton, experiment: @double_helix)

    # Laws of Motion experiment
    ScientistExperiment.create(scientist: @isaac_newton, experiment: @laws_of_motion)
    ScientistExperiment.create(scientist: @marie_curie, experiment: @laws_of_motion)
  end

  it 'shows all attributes and lab name for/associated w the scientist' do
    visit 

    @marie_curie = Scientist.create(name: 'Marie Curie', specialty: 'Radioactivity', university: 'University of Paris', lab: @lab)
    within "#scientist-info" do
      expect(page).to have_content("Scientist Name: Marie Curie")
      expect(page).to have_content("Scientist Specialty: Radioactivity")
      expect(page).to have_content("University: University of Paris")
      expect(page).to have_content("Lab: Fermilab")
    end
  end

  it 'shows all their experiments' do
    within "#scientist-experiments" do
      expect(page).to have_content(@laws_of_motion.name)
      expect(page).to have_content(@minerva.name)
    end
  end
end