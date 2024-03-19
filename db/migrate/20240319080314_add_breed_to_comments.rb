class AddBreedToComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :breed, null: false, foreign_key: true
  end
end
