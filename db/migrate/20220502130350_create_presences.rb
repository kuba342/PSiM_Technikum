class CreatePresences < ActiveRecord::Migration[7.0]
  def change
    create_table :presences do |t|
      t.boolean :isPresent
      t.references :student, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
