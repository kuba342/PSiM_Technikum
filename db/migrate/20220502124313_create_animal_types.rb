class CreateAnimalTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :animal_types do |t|
      t.string :species
      t.string :group

      t.timestamps
    end
  end
end
