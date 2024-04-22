require 'rails_helper'

RSpec.describe Experiment do
  describe "relationships" do
    it {should have_many :scientists}
    it {should have_many :scientist_experiments}
  end

  before(:each) do
    @lab1 = Lab.create!(name: "Fusion Lab")
    @lab2 = Lab.create!(name: "Fission Lab")
    @scientist1 = @lab1.scientists.create!(name: "Dr. Atom", specialty: "Atoms", university: "Atom University")
    @scientist2 = @lab1.scientists.create!(name: "Dr. Neutron", specialty: "Neutrons", university: "Neutron University")
    @experiment1 = Experiment.create!(name: "Splitting the Atom", objective: "Split the atom", num_months: 12)
    @experiment2 = Experiment.create!(name: "Putting the Atom Back Together", objective: "Put the atom back together", num_months: 24)
    @experiment3 = Experiment.create!(name: "Super Glue", objective: "Make the world's strongest glue", num_months: 7)
    @experiment4 = Experiment.create!(name: "Super Duper Glue", objective: "Make the world's even stronger strongest glue", num_months: 3)
    @experiment1.scientists << @scientist1
    @experiment1.scientists << @scientist2
    @experiment2.scientists << @scientist1
  end

  describe "class methods" do
    describe "#order_by_num_months" do
      it "orders experiments from longest to shortest experiment length" do
        ordered = Experiment.order_by_num_months
        expect(ordered).to eq([@experiment2, @experiment1, @experiment3, @experiment4])
      end
    end

    describe "#long_running_experiments" do
      it "filters experiments to only show those longer than six months in duration" do
        filtered = Experiment.long_running_experiments
        expect(filtered).to match_array([@experiment2, @experiment1, @experiment3])
      end
    end
  end
end