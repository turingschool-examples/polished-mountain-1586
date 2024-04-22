require "rails_helper"

RSpec.describe "scientists show page" do

  # User Story 1, Scientist Show Page
  it "lists the scientist's name, specialty, university, lab, and experiments" do
    @lab_1 = Lab.create!(name: "Lab 1")
    @john = Scientist.create!(name: "John", specialty: "Chemical Reactions", university: "University of Nebraska", lab_id: @lab_1.id)
    @teleportation = Experiment.create!(name: "Teleportation", objective: "This is the objective statement for the experiment", num_months: 20)
    @levitation = Experiment.create!(name: "Levitation", objective: "This is the objective statement for the experiment", num_months: 10)
    ScientistExperiment.create!(scientist_id: @john.id, experiment_id: @teleportation.id)
    ScientistExperiment.create!(scientist_id: @john.id, experiment_id: @levitation.id)

    # As a visitor, when I visit a scientist's show page
    visit "/scientists/#{@john.id}"

    # I see all of that scientist's information including:
    within ".scientist_info" do
      # - name  
      expect(page).to have_content(@john.name)
      # - specialty  
      expect(page).to have_content(@john.specialty)
      # - university where they got their degree
      expect(page).to have_content(@john.university)
      # And I see the name of the lab where this scientist works
      expect(page).to have_content(@john.lab.name)
    end

    # And I see the names of all of the experiments this scientist is running
    within ".experiment_info" do
      expect(page).to have_content(@teleportation.name)
      expect(page).to have_content(@levitation.name)
    end
  end


end