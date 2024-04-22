# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

laboratory = Lab.create!(
  name: "Falconer Lab"
)

scientist1 = Scientist.create!(
  name: "John Falconer",
  specialty: "Thermodynamics",
  university: "University of Colorado Boulder",
  lab: laboratory
)

scientist2 = Scientist.create!(
  name: "Neil Hendren",
  specialty: "Simulations",
  university: "University of Colorado Boulder",
  lab: laboratory
)

experiment1 = Experiment.create!(
  name: "Thin-Membrane Separations",
  objective: "Separate gasses into individual components using thin membranes",
  num_months: 36
)

experiment2 = Experiment.create!(
  name: "Gas-Phase Reaction Characterization",
  objective: "Find a reaction mechanism for various gas-phase reactions",
  num_months: 50
)

ScientistExperiment.create!(
  scientist: scientist1,
  experiment: experiment1
)

ScientistExperiment.create!(
  scientist: scientist1,
  experiment: experiment2
)

ScientistExperiment.create!(
  scientist: scientist2,
  experiment: experiment1
)
