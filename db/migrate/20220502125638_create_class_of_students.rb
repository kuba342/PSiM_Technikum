class CreateClassOfStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :class_of_students do |t|
      t.string :symbol
      t.integer :yearOfStart
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
