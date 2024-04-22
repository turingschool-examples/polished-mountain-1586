require "rails_helper"

RSpec.describe "Scientists show page" do
  before(:each) do
    @laboratory = Lab.create!(
      name: "Falconer Lab"
    )

    @scientist = Scientist.create!(
      name: "John Falconer",
      specialty: "Thermodynamics",
      university: "University of Colorado Boulder",
      lab: @laboratory
    )

    @experiment1 = Experiment.create!(
      name: "Thin-Membrane Separations",
      objective: "Separate gasses into individual components using thin membranes",
      num_months: 36
    )

    @experiment2 = Experiment.create!(
      name: "Gas-Phase Reaction Characterization",
      objective: "Find a reaction mechanism for various gas-phase reactions",
      num_months: 50
    )

    ScientistExperiment.create!(
      scientist: @scientist,
      experiment: @experiment1
    )

    ScientistExperiment.create!(
      scientist: @scientist,
      experiment: @experiment2
    )

    visit "scientists/#{@scientist.id}"
  end

  it "shows the scientist's information" do
    within ".page-header" do
      expect(page).to have_content("John Falconer")
    end

    within "#information" do
      expect(page).to have_content("Specialty: Thermodynamics")
      expect(page).to have_content("University: University of Colorado Boulder")
      expect(page).to have_content("This scientist works in the Falconer Lab")
    end
  end

  it "displays the experiments this scientist is working on" do
    within "#experiments" do
      expect(page).to have_content("Experiments this scientist is working on:")
      expect(page).to have_content("Thin-Membrane Separations")
      expect(page).to have_content("Gas-Phase Reaction Characterization")
    end
  end
end
