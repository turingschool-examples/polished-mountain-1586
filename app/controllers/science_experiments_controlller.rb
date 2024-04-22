class ScientistsController < ApplicationController
  def delete
    @scientist = Scientist.find(params[:scientist_id])
    @experiment = Experiment.find(params[:experiment_id])
    
    @scientist.experiments.delete(@experiment)
    redirect_to scientist_path(@scientist)
  end
end