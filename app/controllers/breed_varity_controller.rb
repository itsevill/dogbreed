class BreedVarityController < ApplicationController
  def show
    @breed_variety = BreedVariety.find(params[:id])
  end
end
