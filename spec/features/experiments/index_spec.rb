require "rails_helper"

RSpec.describe "Experiments Index Page" do
  before(:each) do
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

    visit "/experiments"
  end

  it "list experiments longer than 6 months in descending order of number of months" do
    within ".page-title" do
      expect(page).to have_content("Scientific Experiments")
    end

    within "#experiments-list" do
      expect(@experiment3.name).to appear_before(@experiment2.name)
      expect(@experiment2.name).to appear_before(@experiment1.name)
      expect(page).to_not have_content(@experiment4.name)
    end
  end
end
