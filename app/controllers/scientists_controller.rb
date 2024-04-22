class ScientistsController < ApplicationController
  # def index
  #   @scientist = Scientist.all
  # end
  
  def show
    @scientist = Scientist.find(params[:id])
  end
end