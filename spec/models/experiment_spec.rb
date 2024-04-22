require "rails_helper"

RSpec.describe Experiment, type: :model do
  before :each do
    @experiment1 = Experiment.create!(name: "Experiment 1", objective: "Objective 1", num_months: 6)
    @experiment2 = Experiment.create!(name: "Experiment 2", objective: "Objective 2", num_months: 12)
    @experiment3 = Experiment.create!(name: "Experiment 3", objective: "Objective 3", num_months: 9)
    @experiment4 = Experiment.create!(name: "Experiment 4", objective: "Objective 4", num_months: 2)
    
    @lab1 = Lab.create!(name: "Lab 1")
    @lab2 = Lab.create!(name: "Lab 2")

    @scientist1 = Scientist.create!(name: "Scientist 1", specialty: "Specialty 1", university: "University 1", lab_id: @lab1.id)
    @scientist2 = Scientist.create!(name: "Scientist 2", specialty: "Specialty 2", university: "University 2", lab_id: @lab2.id)
    @scientist3 = Scientist.create!(name: "Scientist 3", specialty: "Specialty 3", university: "University 3", lab_id: @lab1.id)

    @scientist_experiment1 = ScientistExperiment.create!(scientist_id: @scientist1.id, experiment_id: @experiment1.id)
    @scientist_experiment2 = ScientistExperiment.create!(scientist_id: @scientist2.id, experiment_id: @experiment1.id)
    @scientist_experiment3 = ScientistExperiment.create!(scientist_id: @scientist2.id, experiment_id: @experiment2.id)
    @scientist_experiment4 = ScientistExperiment.create!(scientist_id: @scientist3.id, experiment_id: @experiment3.id)
    @scientist_experiment5 = ScientistExperiment.create!(scientist_id: @scientist3.id, experiment_id: @experiment4.id)
  end
  
  describe "relationships" do
    it { should have_many :scientist_experiments }
    it { should have_many(:scientists).through(:scientist_experiments) }
  end

  describe ".class methods" do
    it "long_running_experiments" do
      @long_running_experiments = Experiment.all.long_running_experiments
      expect(@long_running_experiments).to eq([@experiment2, @experiment3])
    end
  end
end