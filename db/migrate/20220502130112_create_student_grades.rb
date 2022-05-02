class CreateStudentGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :student_grades do |t|
      t.float :grade
      t.datetime :date
      t.references :teacher, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
