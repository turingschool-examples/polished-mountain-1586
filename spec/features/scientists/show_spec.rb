require 'rails_helper'

RSpec.describe "Scientist Show Page", type: :feature do
  before :each do
    @lab = Lab.create!(name: 'Cool Lab')

    @marie_curie = Scientist.create!(name: 'Marie Curie', specialty: 'Radioactivity', university: 'University of Paris', lab: @lab, id: 1)
    @richard_feynman = Scientist.create!(name: 'Richard Feynman', specialty: 'Theoretical Physics', university: 'Princeton University', lab: @lab, id: 2)
    @isaac_newton = Scientist.create!(name: 'Isaac Newton', specialty: 'Physics and Mathematics', university: 'University of Cambridge', lab: @lab, id: 3)

    @minerva = Experiment.create!(name: 'MINERvA', objective: 'Study neutrino reactions with five different nuclei', num_months: 4, id: 1)
    @double_helix = Experiment.create!(name: 'Double Helix', objective: 'Study DNA structure', num_months: 10, id: 2)
    @laws_of_motion = Experiment.create!(name: 'Laws of Motion', objective: 'Explore laws of motion and gravitation', num_months: 8, id: 3)

    ScientistExperiment.create!(scientist: @marie_curie, experiment: @minerva)
    ScientistExperiment.create!(scientist: @richard_feynman, experiment: @minerva)
    ScientistExperiment.create!(scientist: @richard_feynman, experiment: @double_helix)
    ScientistExperiment.create!(scientist: @isaac_newton, experiment: @double_helix)
    ScientistExperiment.create!(scientist: @isaac_newton, experiment: @laws_of_motion)
    ScientistExperiment.create!(scientist: @marie_curie, experiment: @laws_of_motion)
  end

  it 'shows all attributes and lab name for the scientist' do
    visit scientist_path(@marie_curie)

    within "#scientist-info" do
      expect(page).to have_content("Scientist Name: Marie Curie")
      expect(page).to have_content("Specialty: Radioactivity")
      expect(page).to have_content("University: University of Paris")
      expect(page).to have_content("Lab: Cool Lab")
    end
  end

  it 'shows all their experiments' do
    visit scientist_path(@marie_curie)

    within "#scientist-experiments" do
      expect(page).to have_content(@minerva.name)
      expect(page).to have_content(@laws_of_motion.name)
    end
  end

  it 'has a button to remove an experiment' do
    visit scientist_path(@marie_curie)

    expect(page).to have_button("Remove #{@minerva.name}")
  end

  it 'can redirect after deleting and experiment and show a scientists updated workload' do
    visit scientist_path(@marie_curie)
    expect(page).to have_content("MINERvA")
    expect(page).to have_content("Laws of Motion")

    click_on "Remove #{@minerva.name}"

    expect(current_path).to eq(scientist_path(@marie_curie))
    expect(page).to_not have_content("MINERvA")
    expect(page).to have_content("Laws of Motion")
  end
end
