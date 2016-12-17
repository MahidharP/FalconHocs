class CreateInterviewQuestionCategories < ActiveRecord::Migration
  def change
    create_table :interview_question_categories do |t|
      t.integer :interview_id
      t.integer :question_category_id

      t.timestamps null: false
    end
  end
end
