# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do
  Experiment.create!(
    name: Faker::Science.element,
    objective: Faker::Lorem.sentence,
    num_months: rand(1..12)
  )
end

# Lab seeds
5.times do
  Lab.create!(
    name: Faker::University.name
  )
end

# Scientist seeds
5.times do
  lab = Lab.offset(rand(Lab.count)).first
  Scientist.create!(
    name: Faker::Name.unique.name,
    specialty: Faker::Job.field,
    university: Faker::University.name,
    lab: lab
  )
end

# ScientistExperiment seeds
5.times do
  scientist = Scientist.offset(rand(Scientist.count)).first
  experiment = Experiment.offset(rand(Experiment.count)).first
  ScientistExperiment.create!(
    scientist: scientist,
    experiment: experiment
  )
end