class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :user_id
      t.string  :form_params
      t.text    :question_ids

      t.timestamps null: false
    end
  end
end
