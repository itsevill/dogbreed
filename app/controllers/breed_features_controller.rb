class BreedFeaturesController < ApplicationController
  def show
    @breed_feature = BreedFeature.find(params[:id])
  end
end
