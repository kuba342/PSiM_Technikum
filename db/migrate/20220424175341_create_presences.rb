class CreatePresences < ActiveRecord::Migration[7.0]
  def change
    create_table :presences do |t|
      t.belongs_to :students, foreign_key: true
      t.belongs_to :lessons, foreign_key: true
      t.boolean :isPresent

      t.timestamps
    end
  end
end
