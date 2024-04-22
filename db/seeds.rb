# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@lab_1 = Lab.create!(name: "Lab 1")
@john = Scientist.create!(name: "John", specialty: "Chemical Reactions", university: "University of Nebraska", lab_id: @lab_1.id)
@billy = Scientist.create!(name: "Billy", specialty: "Basketball IQ", university: "University of North Colrado", lab_id: @lab_1.id)

@lab_2 = Lab.create!(name: "Lab 2")
@grant = Scientist.create!(name: "Grant", specialty: "Chain Reactions", university: "University of Colorado Boulder", lab_id: @lab_2.id)
@jared = Scientist.create!(name: "Jared", specialty: "Nuclear Fission", university: "Florida State University", lab_id: @lab_1.id)

@teleportation = Experiment.create!(name: "Teleportation", objective: "This is the objective statement for the experiment", num_months: 20)
@levitation = Experiment.create!(name: "Levitation", objective: "This is the objective statement for the experiment", num_months: 10)
@time_travel = Experiment.create!(name: "Time Travel", objective: "This is the objective statement for the experiment", num_months: 6)
@invisibility = Experiment.create!(name: "Invisibility", objective: "This is the objective statement for the experiment", num_months: 2)

ScientistExperiment.create!(scientist_id: @john.id, experiment_id: @teleportation.id)
ScientistExperiment.create!(scientist_id: @john.id, experiment_id: @levitation.id)
ScientistExperiment.create!(scientist_id: @john.id, experiment_id: @invisibility.id)

ScientistExperiment.create!(scientist_id: @billy.id, experiment_id: @teleportation.id)
ScientistExperiment.create!(scientist_id: @billy.id, experiment_id: @invisibility.id)

ScientistExperiment.create!(scientist_id: @grant.id, experiment_id: @teleportation.id)
ScientistExperiment.create!(scientist_id: @grant.id, experiment_id: @invisibility.id)
ScientistExperiment.create!(scientist_id: @grant.id, experiment_id: @time_travel.id)
ScientistExperiment.create!(scientist_id: @grant.id, experiment_id: @levitation.id)

ScientistExperiment.create!(scientist_id: @jared.id, experiment_id: @invisibility.id)
ScientistExperiment.create!(scientist_id: @jared.id, experiment_id: @time_travel.id)
ScientistExperiment.create!(scientist_id: @jared.id, experiment_id: @levitation.id)

puts "Seeded Successfully"