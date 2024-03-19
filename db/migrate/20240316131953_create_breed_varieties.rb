class CreateBreedVarieties < ActiveRecord::Migration[7.1]
  def change
    create_table :breed_varieties do |t|
      t.string :name
      t.references :breed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
