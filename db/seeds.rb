require 'open-uri'
require 'json'
require 'faker'

# Assuming the existence of Comment model related destructions
Comment.destroy_all
BreedFeature.destroy_all
BreedVariety.destroy_all
Breed.destroy_all

dog_features = [
  { feature_name: 'Friendly', feature_description: 'The breed is known for its friendly and approachable demeanor, great for families.' },
  { feature_name: 'Active', feature_description: 'This breed requires a lot of exercise and loves to play, perfect for those with an active lifestyle.' },
  { feature_name: 'Intelligent', feature_description: 'Highly intelligent and easy to train, this breed is ideal for learning new tricks.' },
  { feature_name: 'Loyal', feature_description: 'This breed is known for its loyalty and steadfast companionship.' },
  { feature_name: 'Gentle', feature_description: 'With a gentle nature, this breed is good around children and the elderly.' },
  { feature_name: 'Agile', feature_description: 'This breed is agile and quick, suitable for agility training and competitions.' },
  { feature_name: 'Protective', feature_description: 'This breed has a protective instinct and can be a good watchdog.' },
  { feature_name: 'Adaptable', feature_description: 'Adaptable to various living conditions, this breed is suited for both apartments and houses.' },
  { feature_name: 'Hardy', feature_description: 'A robust and hardy breed, it can withstand cold climates and rugged terrains.' },
  { feature_name: 'Affectionate', feature_description: 'This breed loves to show affection and enjoys cuddling.' }
]

# Function to fetch the list of breeds and sub-breeds from the Dog Breed API
def fetch_breed_list
  url = 'https://dog.ceo/api/breeds/list/all'
  response = URI.open(url).read
  JSON.parse(response)['message']
end

# Function to fetch a random image for a breed
def fetch_random_breed_image
  url = 'https://dog.ceo/api/breeds/image/random'
  response = URI.open(url).read
  JSON.parse(response)['message']
end

# Seed the breeds, their varieties, and features
breed_list = fetch_breed_list
breed_list.each do |breed, sub_breeds|
  breed_record = Breed.create!(
    name: breed.capitalize,
    image_url: fetch_random_breed_image
  )

  sub_breeds.each do |sub_breed|
    BreedVariety.create!(
      name: sub_breed.capitalize,
      breed: breed_record
    )
  end

  dog_features.sample(3).each do |feature|
    BreedFeature.create!(
      feature_name: feature[:feature_name],
      feature_description: feature[:feature_description],
      breed: breed_record
    )
  end

  # Generate and assign comments to the breed using Faker
  5.times do # Assuming you want to generate 5 comments per breed
    Comment.create!(
      email: Faker::Internet.email,
      comment: Faker::Lorem.sentence(word_count: 15),
      breed: breed_record
    )
  end
end

puts 'Seeding completed!'
