class ScientistExperimentsController < ApplicationController
  def destroy
    scientist = Scientist.find(params[:id])
    experiments = scientist.experiments
    experiment = experiments.find(params[:id])
    scientist_experiment = scientist.scientist_experiments.find_by(scientist_id: scientist.id, experiment_id: experiment.id)

    scientist_experiment.destroy

    redirect_to scientist_path(scientist)
  end
end