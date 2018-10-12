class SpeciesController < ApplicationController
  def index
    @species = Species.all
    @species = Species.all.page(params[:page])
  end

  def show
    @species = Species.find(params[:id])
  end
end
