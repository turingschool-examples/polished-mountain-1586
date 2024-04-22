require 'rails_helper'

RSpec.describe Experiment do
  it {should have_many(:scientist_experiments)}
  it {should have_many(:scientists).through(:scientist_experiments)}

  describe "class methods" do
    it "#long_experiments" do     
      @teleportation = Experiment.create!(name: "Teleportation", objective: "The ability to jump from one place to another", num_months: 20)
      @levitation = Experiment.create!(name: "Levitation", objective: "The ability to float in mid-air", num_months: 10)
      @time_travel = Experiment.create!(name: "Time Travel", objective: "The ability to jump ahead or back in time", num_months: 6)
      @invisibility = Experiment.create!(name: "Invisibility", objective: "The ability to be blend into your surroundings", num_months: 2)
      @invincibility = Experiment.create!(name: "Invincibility", objective: "The ability to never get hurt", num_months: 70)

      expect(Experiment.long_experiments).to eq([@invincibility, @teleportation, @levitation])
    end
  end
end