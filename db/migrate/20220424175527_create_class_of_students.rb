class CreateClassOfStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :class_of_students do |t|
      t.belongs_to :teacher, foreign_key: true

      t.string :symbol
      t.integer :yearOfStart

      t.timestamps
    end
  end
end
