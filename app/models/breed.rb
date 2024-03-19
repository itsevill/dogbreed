class Breed < ApplicationRecord
  has_many :breed_varieties, dependent: :destroy
  has_many :breed_features, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :name, presence: true
  validates :image_url, presence: true
end
  
