require 'rails_helper'

RSpec.describe Experiment do
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

  describe 'relationships' do
    it {should have_many :scientist_experiments}
    it {should have_many(:scientists).through(:scientist_experiments)}
  end

  it "#long_running_experiments" do
    expect(Experiment.long_running_experiments).to contain_exactly(@double_helix, @laws_of_motion)
  end

  it "#names_in_descending_order" do
    expect(Experiment.names_in_descending_order).to eq([@laws_of_motion.name, @double_helix.name, @minerva.name])
  end
end