# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@lab = Lab.create!(name: "Tampa Lab")

@scientist_1 = Scientist.create!(
  name: "Luis",
  specialty: "Numbers",
  university: "Harvard",
  lab_id: @lab.id
)

@scientist_2 = Scientist.create!(
  name: "Walter",
  specialty: "Persons",
  university: "Tampa University",
  lab_id: @lab.id
)

@experiment1 = Experiment.create!(
  name: "Fire",
  objective: "Test for fire",
  num_months: 7
)

@experiment2 = Experiment.create!(
  name: "Polution",
  objective: "Test for polution",
  num_months: 6
)

@experiment3 = Experiment.create!(
  name: "Hello",
  objective: "Test for Luis",
  num_months: 8
)

@experiment_scientists_1 = ExperimentScientist.create!(experiment_id: @experiment1.id, scientist_id: @scientist_1.id)
@experiment_scientists_2 = ExperimentScientist.create!(experiment_id: @experiment2.id, scientist_id: @scientist_1.id)
@experiment_scientists_3 = ExperimentScientist.create!(experiment_id: @experiment1.id, scientist_id: @scientist_2.id)
