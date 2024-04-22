require "rails_helper"

RSpec.describe "Lab Show Page" do
  before(:each) do
    @laboratory = Lab.create!(
      name: "Falconer Lab"
    )

    @scientist1 = Scientist.create!(
      name: "John Falconer",
      specialty: "Thermodynamics",
      university: "University of Colorado Boulder",
      lab: @laboratory
    )

    @scientist2 = Scientist.create!(
      name: "Neil Hendren",
      specialty: "Simulations",
      university: "University of Colorado Boulder",
      lab: @laboratory
    )

    @scientist3 = Scientist.create!(
      name: "Will Medlin",
      specialty: "Biofuels",
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

    @experiment3 = Experiment.create!(
      name: "LearnChemE Simulations",
      objective: "Write scientific simulations for LearnChemE.com",
      num_months: 72
    )

    @experiment4 = Experiment.create!(
      name: "Explosives",
      objective: "Create as deadly of explosives as possible",
      num_months: 6
    )

    ScientistExperiment.create!(
      scientist: @scientist1,
      experiment: @experiment1
    )

    ScientistExperiment.create!(
      scientist: @scientist2,
      experiment: @experiment1
    )

    ScientistExperiment.create!(
      scientist: @scientist2,
      experiment: @experiment2
    )

    ScientistExperiment.create!(
      scientist: @scientist3,
      experiment: @experiment2
    )

    ScientistExperiment.create!(
      scientist: @scientist3,
      experiment: @experiment3
    )

    ScientistExperiment.create!(
      scientist: @scientist3,
      experiment: @experiment4
    )

    visit labs_path
  end

  it "shows the lab's name and all of the scientists in that lab" do
    within ".page-header" do
      expect(page).to have_content("Falconer Lab")
    end

    within "#scientists" do
      expect("Will Medlin").to appear_before("Neil Hendren")
      expect("Neil Hendren").to appear_before("John Falconer")

      within "#scientist-#{@scientist1.id}" do
        expect(page).to have_content("Number of Experiments: 1")
      end

      within "#scientist-#{@scientist2.id}" do
        expect(page).to have_content("Number of Experiments: 2")
      end

      within "#scientist-#{@scientist3.id}" do
        expect(page).to have_content("Number of Experiments: 3")
      end
    end
  end
end
