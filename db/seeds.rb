# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@lab = Lab.create!(name: "Fermilab")

@marie = @lab.scientists.create!(name: "Marie Curie", specialty: "Radioactivity", university: "University of Paris")
@darwin = @lab.scientists.create!(name: "Chuck Darwin", specialty: "Bird Beaks", university: "Galapagos Islands")

@minerva = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
@exp2 = Experiment.create!(name: "Nobel Prize Idea", objective: "Something super duper smart", num_months: 4)
@exp3 = Experiment.create!(name: "Accredidate Husband's name", objective: "Table of Elements Creation", num_months: 4)
@exp4 = Experiment.create!(name: "Make Friends", objective: "Befriend Jane Goodall and Primates", num_months: 57)

@marie.experiments << [@minerva, @exp2, @exp3, @exp4]
@darwin.experiments << @exp4