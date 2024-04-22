class ScientistExperimentsController < ApplicationController 
  def destroy
    @scientist = Scientist.find(params[:scientist_id])
    @experiment = Experiment.find(params[:id])
    
    @deleted_experiment = ScientistExperiment.find_by(
      scientist: @scientist,
      experiment: @experiment
    )

    @deleted_experiment.destroy

    redirect_to "/scientists/#{@scientist.id}"
  end
end