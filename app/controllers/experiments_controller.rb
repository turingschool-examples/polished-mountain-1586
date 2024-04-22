class ExperimentsController < ApplicationController 
  def index
    @long_experiments = Experiment.long_experiments
  end
end