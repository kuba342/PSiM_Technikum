class CreateAnimals < ActiveRecord::Migration[7.0]
  def change
    create_table :animals do |t|
      t.string :code
      t.references :animal_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
