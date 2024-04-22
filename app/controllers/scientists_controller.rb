class ScientistsController < ApplicationController
  def show
    # require 'pry' ; binding.pry
    @scientist = Scientist.find(params[:id])
  end
end