require 'rails_helper'

RSpec.describe 'experiment#index', type: :feature do
  before(:each) do
    @lab = Lab.create!(name: "Tampa Lab")

    @scientist_1 = Scientist.create!(
      name: "Luis",
      specialty: "Numbers",
      university: "Harvard",
      lab_id: @lab.id
    )

    @scientist_2 = Scientist.create!(
      name: "Walter",
      specialty: "Persons",
      university: "Tampa University",
      lab_id: @lab.id
    )

    @experiment1 = Experiment.create!(
      name: "Fire",
      objective: "Test for fire",
      num_months: 7
    )

    @experiment2 = Experiment.create!(
      name: "Polution",
      objective: "Test for polution",
      num_months: 6
    )

    @experiment3 = Experiment.create!(
      name: "Hello",
      objective: "Test for Luis",
      num_months: 8
    )

    @experiment_scientists_1 = ExperimentScientist.create!(experiment_id: @experiment1.id, scientist_id: @scientist_1.id)
    @experiment_scientists_2 = ExperimentScientist.create!(experiment_id: @experiment2.id, scientist_id: @scientist_1.id)
    @experiment_scientists_3 = ExperimentScientist.create!(experiment_id: @experiment1.id, scientist_id: @scientist_2.id)
  end

  # User Story 3, Experiment Index Page
  it "displays the name in descending order with num_months longer than 6 months" do
    # As a visitor
    # When I visit the experiment index page
    visit experiments_path

    within '.name_experiments' do
      expect(page).to have_content("Long Running Experiments Names:")
      # I see the names of all long running experiments (longer than 6 months),
      # And I see the names are in descending order (longest to shortest)
      expect(page).to have_content("Hello")
      expect(page).to have_content("Fire")
      expect(page).to_not have_content("Polution")
    end
  end
end