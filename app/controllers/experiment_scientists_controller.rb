class ExperimentScientistsController < ApplicationController
  def destroy
    @scientist = Scientist.find(params[:id])

    exp_sci = ExperimentScientist.find_by(scientist: @scientist, experiment: params[:experiment_id])

    exp_sci.delete

    redirect_to scientist_path(@scientist)
  end
end