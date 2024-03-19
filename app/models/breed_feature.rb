class BreedFeature < ApplicationRecord
  belongs_to :breed

  validates :feature_name, presence: true
  validates :feature_description, presence: true
end
