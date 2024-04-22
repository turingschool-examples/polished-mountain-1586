require "rails_helper"

RSpec.describe "experiments index page" do

  # User Story 3, Experiment Index Page
  it "lists all long running experiments over 6 months and in descenging order" do
    # Setup
    @lab_1 = Lab.create!(name: "Lab 1")
    @john = Scientist.create!(name: "John", specialty: "Chemical Reactions", university: "University of Nebraska", lab_id: @lab_1.id)
    @radioactivity = Experiment.create!(name: "Radioactivity", objective: "This is the objective statement for the experiment", num_months: 7)
    @teleportation = Experiment.create!(name: "Teleportation", objective: "This is the objective statement for the experiment", num_months: 20)
    @levitation = Experiment.create!(name: "Levitation", objective: "This is the objective statement for the experiment", num_months: 10)
    @physics = Experiment.create!(name: "Physics", objective: "This is the objective statement for the experiment", num_months: 5)
    ScientistExperiment.create!(scientist_id: @john.id, experiment_id: @teleportation.id)
    ScientistExperiment.create!(scientist_id: @john.id, experiment_id: @levitation.id)
    ScientistExperiment.create!(scientist_id: @john.id, experiment_id: @radioactivity.id)
    ScientistExperiment.create!(scientist_id: @john.id, experiment_id: @physics.id)

    # As a visitor, when I visit the experiment index page
    visit "/experiments"

    # I see the names of all long running experiments (longer than 6 months),
    within ".experiments" do
      expect(page).not_to have_content(@physics.name)
    end

    # And I see the names are in descending order (longest to shortest)
    within ".experiments" do
      expect(@teleportation.name).to appear_before(@levitation.name)
      expect(@levitation.name).to appear_before(@radioactivity.name)
    end
  end

end