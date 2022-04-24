class CreateAnimals < ActiveRecord::Migration[7.0]
  def change
    create_table :animals do |t|
      t.belongs_to :animal_type, foreign_key: true
      t.string :code

      t.timestamps
    end
  end
end
