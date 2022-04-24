class CreateStudentGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :student_grades do |t|
      t.belongs_to :teacher, foreign_key: true
      t.belongs_to :student, foreign_key: true
      t.belongs_to :course, foreign_key: true
      t.belongs_to :test, foreign_key: true

      t.float :grade
      t.datetime :date

      t.timestamps
    end
  end
end
