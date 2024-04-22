class ScientistExperimentsController < ApplicationController
  def destroy
    @scientist_experiment = ScientistExperiment.find(params[:id])
    @scientist_experiment.destroy
    redirect_to(scientist_path(@scientist_experiment.scientist_id))
  end
end
