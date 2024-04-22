class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.all
    require 'pry' ; binding.pry
  end
end