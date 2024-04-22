class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.long_running_experiments
  end
end
