class CreateTextMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :text_messages do |t|
      t.belongs_to :user1, foreign_key: true
      t.belongs_to :user2, foreign_key: true

      t.string :message
      t.string :topic

      t.timestamps
    end
  end
end
