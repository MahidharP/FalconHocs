class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.datetime :slot
      t.string :type
      t.text :description
      t.text :remarks
      t.integer :student_id
      t.integer :user_id
      t.integer :interviewer_id

      t.timestamps null: false
    end
  end
end
