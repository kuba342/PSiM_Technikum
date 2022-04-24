class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.belongs_to :lessons, foreign_key: true

      t.string :name

      t.timestamps
    end
  end
end
