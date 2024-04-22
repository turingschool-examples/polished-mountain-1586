class ScientistsController < ApplicationController
  def show
    @scientist = Scientist.find(params[:id])
  end

  def destroy
    scientist = Scientist.find(params[:id])
    experiment = Experiment.find(params[:experiment_id])
    scientist.experiments.delete(experiment)
    redirect_to scientist_path(scientist)
  end
end