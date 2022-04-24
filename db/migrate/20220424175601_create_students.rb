class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :class_of_students, foreign_key: true

      t.string :firstName
      t.string :lastName

      t.timestamps
    end
  end
end
