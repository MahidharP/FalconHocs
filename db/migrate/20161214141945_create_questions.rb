class CreateQuestions < ActiveRecord::Migration
    def change
        create_table :questions do |t|
            t.string :title
            t.boolean :status, default: false
            t.integer :question_category_id

            t.timestamps null: false
        end
    end
end
