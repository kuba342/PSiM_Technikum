class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :firstName
      t.string :lastName
      t.references :user, null: false, foreign_key: true
      t.references :class_of_student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
