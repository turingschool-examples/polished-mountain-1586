require "rails_helper"

RSpec.describe Scientist do
  it { should belong_to :lab }
  it { should have_many :scientist_experiments }
  it { should have_many(:experiments).through(:scientist_experiments) }

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

    @experiment3 = Experiment.create!(
      name: "LearnChemE Simulations",
      objective: "Write scientific simulations for LearnChemE.com",
      num_months: 72
    )

    ScientistExperiment.create!(
      scientist: @scientist,
      experiment: @experiment1
    )

    ScientistExperiment.create!(
      scientist: @scientist,
      experiment: @experiment2
    )

    ScientistExperiment.create!(
      scientist: @scientist,
      experiment: @experiment3
    )
  end

  it "lists the count of experiments for the scientist" do
    expect(@scientist.experiment_count).to eq(3)
  end
end
