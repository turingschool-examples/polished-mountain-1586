class ExperimentScientistsController < ApplicationController
  def destroy
    # require 'pry' ; binding.pry
    @scientist = Scientist.find(params[:scientist_id])
    @experiment = Experiment.find(params[:id])
    @experiment_scientist = ExperimentScientist.find_by(scientist_id: @scientist, experiment_id: @experiment)
    @experiment_scientist.destroy
    redirect_to scientist_path(@scientist)
  end
end