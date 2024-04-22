class ScientistExperimentsController < ApplicationController
  def destroy
    @scientist_experiment = ScientistExperiment.find_by(
                            scientist_id: params[:id], 
                            experiment_id: params[:experiment_id])
    @scientist_experiment.destroy
    redirect_to scientist_path(@scientist_experiment.scientist)
  end
end