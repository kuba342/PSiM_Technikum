class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.belongs_to :user, foreign_key: true

      t.string :firstName
      t.string :lastName

      t.timestamps
    end
  end
end
