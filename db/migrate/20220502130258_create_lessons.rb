class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.datetime :date
      t.references :teacher, null: false, foreign_key: true
      t.references :class_of_student, null: false, foreign_key: true
      t.references :animal, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.references :classroom, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
