class LabsController < ApplicationController
  def show
    @lab = Lab.find(params[:id])
    @scientists = Lab.scientists_with_experiments
  end
end
