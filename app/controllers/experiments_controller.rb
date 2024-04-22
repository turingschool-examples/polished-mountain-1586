class ExperimentsController < ApplicationController
  def index
    @names_with_long_running_experiments = Experiment.long_running_experiments_in_descending_order
  end
end