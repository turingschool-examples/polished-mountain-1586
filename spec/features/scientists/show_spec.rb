require 'rails_helper'

Rspec.describe 'Scientist Show Pg' do
  before :each do
    @lab = Lab.create(name: 'Fermilab')

    @marie_curie = Scientist.create(name: 'Marie Curie', specialty: 'Radioactivity', university: 'University of Paris', lab: @lab)
    @richard_feynman = Scientist.create(name: 'Richard Feynman', specialty: 'Quantum Electrodynamics', university: 'Princeton University', lab: @lab)
    @isaac_newton = Scientist.create(name: 'Isaac Newton', specialty: 'Classical Mechanics', university: 'University of Cambridge', lab: @lab)

    @minerva = Experiment.create(name: 'MINERvA', objective: 'Study neutrino reactions with five different nuclei', num_months: 4, scientist: @marie_curie)
    @double_helix = Experiment.create(name: 'Double Helix', objective: 'Study DNA structure', num_months: 6, scientist: @richard_feynman)
    @laws_of_motion = Experiment.create(name: 'Laws of Motion', objective: 'Explore laws of motion and gravitation', num_months: 8, scientist: @isaac_newton)

    @scientist_experiment1 = ScientistExperiment.create(scientist: @marie_curie, experiment: @minerva)
    @scientist_experiment2 = ScientistExperiment.create(scientist: @richard_feynman, experiment: @double_helix)
    @scientist_experiment3 = ScientistExperiment.create(scientist: @isaac_newton, experiment: @laws_of_motion)

  end

  it 'shows all attributes for the scientist' do

  end

  it 'shows their university' do

  end

  it 'shows all their experiments' do

  end
end