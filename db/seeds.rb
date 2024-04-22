# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@lab1 = Lab.create!(name: "Fusion Lab")
@lab2 = Lab.create!(name: "Fission Lab")
@scientist1 = @lab1.scientists.create!(name: "Dr. Atom", specialty: "Atoms", university: "Atom University")
@scientist2 = @lab1.scientists.create!(name: "Dr. Neutron", specialty: "Neutrons", university: "Neutron University")
@scientist3 = @lab1.scientists.create!(name: "Dr. Neutrino", specialty: "Neutrinos", university: "Neutrino University")
@scientist4 = @lab2.scientists.create!(name: "Dr. No", specialty: "Nil Values", university: "Nil University")
@experiment1 = Experiment.create!(name: "Splitting the Atom", objective: "Split the atom", num_months: 12)
@experiment2 = Experiment.create!(name: "Putting the Atom Back Together", objective: "Put the atom back together", num_months: 24)
@experiment3 = Experiment.create!(name: "What is Life?", objective: "Discover the meaning of life", num_months: 100)
@experiment1.scientists << @scientist1
@experiment1.scientists << @scientist2
@experiment1.scientists << @scientist3
@experiment2.scientists << @scientist1
@experiment2.scientists << @scientist3
@experiment3.scientists << @scientist1