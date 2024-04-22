require "rails_helper"

RSpec.describe "scientists show page" do

  # User Story 1, Scientist Show Page
  it "lists the scientist's name, specialty, university, lab, and experiments" do
    # Setup
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

  # User Story 2, Remove an Experiment from a Scientist
  it "asdasd" do
    # Setup
    @lab_1 = Lab.create!(name: "Lab 1")
    @john = Scientist.create!(name: "John", specialty: "Chemical Reactions", university: "University of Nebraska", lab_id: @lab_1.id)
    @billy = Scientist.create!(name: "Billy", specialty: "Basketball IQ", university: "University of North Colrado", lab_id: @lab_1.id)
    @teleportation = Experiment.create!(name: "Teleportation", objective: "This is the objective statement for the experiment", num_months: 20)
    ScientistExperiment.create!(scientist_id: @john.id, experiment_id: @teleportation.id)
    ScientistExperiment.create!(scientist_id: @billy.id, experiment_id: @teleportation.id)

    # As a visitor, when I visit a scientist's show page
    visit "/scientists/#{@john.id}"

    # Then next to each experiment's name, I see a button to remove that experiment from that scientist's work load
    within ".experiment_info" do
      expect(page).to have_content(@teleportation.name)
      expect(page).to have_button("Remove Experiment")
    end

    # When I click that button for one experiment
    click_button("Remove Experiment")

    # I'm brought back to the scientist's show page
    expect(current_path).to eq("/scientists/#{@john.id}")

    # And I no longer see that experiment's name listed
    within ".experiment_info" do
      expect(page).not_to have_content("Remove Experiment")
    end

    # And when I visit a different scientist's show page that is working on that same experiment,
    visit "/scientists/#{@billy.id}"
    
    # Then I see that the experiment is still on the other scientist's work load
    within ".experiment_info" do
      expect(page).to have_content(@teleportation.name)
      expect(page).to have_button("Remove Experiment")
    end
  end

end