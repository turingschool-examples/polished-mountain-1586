require "rails_helper"

RSpec.describe Experiment do
  it { should have_many :scientist_experiments }
  it { should have_many(:scientists).through(:scientist_experiments) }

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

    @experiment4 = Experiment.create!(
      name: "Explosives",
      objective: "Create as deadly of explosives as possible",
      num_months: 6
    )

    @scientist_experiment = ScientistExperiment.create!(
      scientist: @scientist,
      experiment: @experiment1
    )
  end

  it "#scientist_experiment" do
    expect(@experiment1.scientist_experiment(
             @scientist
           )).to eq(@scientist_experiment)
  end

  it "#long_running_experiments" do
    expect(Experiment.long_running_experiments).to eq([
      @experiment3, @experiment2, @experiment1
    ])
  end
end
