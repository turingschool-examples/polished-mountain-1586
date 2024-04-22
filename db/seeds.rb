# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@lab = Lab.create!(name: 'Cool Lab')

@marie_curie = Scientist.create!(name: 'Marie Curie', specialty: 'Radioactivity', university: 'University of Paris', lab: @lab, id: 1)
@richard_feynman = Scientist.create!(name: 'Richard Feynman', specialty: 'Theoretical Physics', university: 'Princeton University', lab: @lab, id: 2)
@isaac_newton = Scientist.create!(name: 'Isaac Newton', specialty: 'Physics and Mathematics', university: 'University of Cambridge', lab: @lab, id: 3)

@minerva = Experiment.create!(name: 'MINERvA', objective: 'Study neutrino reactions with five different nuclei', num_months: 4, id: 1)
@double_helix = Experiment.create!(name: 'Double Helix', objective: 'Study DNA structure', num_months: 10, id: 2)
@laws_of_motion = Experiment.create!(name: 'Laws of Motion', objective: 'Explore laws of motion and gravitation', num_months: 8, id: 3)

ScientistExperiment.create!(scientist: @marie_curie, experiment: @minerva)
ScientistExperiment.create!(scientist: @richard_feynman, experiment: @minerva)
ScientistExperiment.create!(scientist: @richard_feynman, experiment: @double_helix)
ScientistExperiment.create!(scientist: @isaac_newton, experiment: @double_helix)
ScientistExperiment.create!(scientist: @isaac_newton, experiment: @laws_of_motion)
ScientistExperiment.create!(scientist: @marie_curie, experiment: @laws_of_motion)