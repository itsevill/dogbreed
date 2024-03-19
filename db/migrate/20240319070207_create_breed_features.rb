class CreateBreedFeatures < ActiveRecord::Migration[7.1]
  def change
    create_table :breed_features do |t|
      t.string :feature_name
      t.text :feature_description
      t.references :breed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
