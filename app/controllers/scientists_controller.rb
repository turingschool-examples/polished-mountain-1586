class Scientists < ApplicationController
  def show
    @scientist = Scientist.find(params[:id])
  end
end