require "rails_helper"

RSpec.describe Experiment do
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

    @experiment = Experiment.create!(
      name: "Thin-Membrane Separations",
      objective: "Separate gasses into individual components using thin membranes",
      num_months: 36
    )

    @scientist_experiment = ScientistExperiment.create!(
      scientist: @scientist,
      experiment: @experiment
    )
  end

  it "#scientist_experiment" do
    expect(@experiment.scientist_experiment(
             @scientist
           )).to eq(@scientist_experiment)
  end
end
