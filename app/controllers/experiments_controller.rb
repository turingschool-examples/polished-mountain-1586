class ExperimentsController < ApplicationController

  def index
    @experiments = Experiment.all
    @experiments_sorted_by_num_months = @experiments.long_running_experiments.names_in_descending_order
  end
end