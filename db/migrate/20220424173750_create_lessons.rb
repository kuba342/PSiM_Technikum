class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.belongs_to :animal, foreign_key: true
      t.belongs_to :classrooms, foreign_key: true
      t.belongs_to :test, foreign_key: true
      t.belongs_to :class_of_students, foreign_key: true
      t.belongs_to :teacher, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
