class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :user_id
      t.integer :question_id
      t.string  :answer
      t.string  :correct_answer
      t.boolean :is_correct

      t.timestamps null: false
    end
  end
end
