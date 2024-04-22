class LabsController < ApplicationController
  def show
    @lab = Lab.find(params[:id])
    @scientists = @lab.scientists.most_to_least_experiments
  end
end