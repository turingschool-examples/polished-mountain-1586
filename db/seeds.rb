# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Experiment.create([
  { name: "Experiment 1", objective: "Objective 1", num_months: 6 },
  { name: "Experiment 2", objective: "Objective 2", num_months: 12 },
  { name: "Experiment 3", objective: "Objective 3", num_months: 9 },
  { name: "Experiment 4", objective: "Objective 4", num_months: 3 },
  { name: "Experiment 5", objective: "Objective 5", num_months: 8 }
])

Lab.create([
  { name: "Lab 1" },
  { name: "Lab 2" },
  { name: "Lab 3" },
  { name: "Lab 4" },
  { name: "Lab 5" }
])

Scientist.create([
  { name: "Scientist 1", specialty: "Specialty 1", university: "University 1", lab_id: 1 },
  { name: "Scientist 2", specialty: "Specialty 2", university: "University 2", lab_id: 2 },
  { name: "Scientist 3", specialty: "Specialty 3", university: "University 3", lab_id: 3 },
  { name: "Scientist 4", specialty: "Specialty 4", university: "University 4", lab_id: 4 },
  { name: "Scientist 5", specialty: "Specialty 5", university: "University 5", lab_id: 5 }
])

ScientistExperiment.create([
  { scientist_id: 1, experiment_id: 1 },
  { scientist_id: 2, experiment_id: 2 },
  { scientist_id: 2, experiment_id: 1 },
  { scientist_id: 3, experiment_id: 3 },
  { scientist_id: 4, experiment_id: 4 },
  { scientist_id: 5, experiment_id: 5 }
])