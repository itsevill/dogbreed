# app/controllers/breeds_controller.rb

class BreedsController < ApplicationController
  def index
    breeds_scope = Breed.all
  
    if params[:query].present?
      # Specify the table name to resolve ambiguity
      breeds_scope = breeds_scope.where('breeds.name LIKE ?', "%#{params[:query]}%")
    end
  
    if params[:with_varieties].present?
      if params[:with_varieties] == 'true'
        # Ensure joins do not introduce ambiguity
        breeds_scope = breeds_scope.joins(:breed_varieties).distinct
      elsif params[:with_varieties] == 'false'
        # Use a LEFT OUTER JOIN to find breeds without varieties
        breeds_scope = breeds_scope.left_outer_joins(:breed_varieties).where(breed_varieties: { id: nil })
      end
    end
  
    @breeds = breeds_scope.page(params[:page]).per(10)
  end
  
  def show
    @breed = Breed.includes(:breed_features).find_by(id: params[:id])
    if @breed.nil?
      redirect_to breeds_path, alert: "Breed not found."
    end
  end
end

