require "rails_helper"

RSpec.describe Lab do
  it { should have_many :scientists }

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

    ScientistExperiment.create!(
      scientist: @scientist2,
      experiment: @experiment1
    )

    ScientistExperiment.create!(
      scientist: @scientist2,
      experiment: @experiment2
    )

    ScientistExperiment.create!(
      scientist: @scientist2,
      experiment: @experiment3
    )

    ScientistExperiment.create!(
      scientist: @scientist1,
      experiment: @experiment1
    )
  end

  it "lists the count of experiments for the scientist" do
    expect(Lab.scientists_with_experiments[0].experiment_count).to eq(3)
    expect(Lab.scientists_with_experiments[1].experiment_count).to eq(1)
  end
end
