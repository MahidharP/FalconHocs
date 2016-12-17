class Question < ActiveRecord::Base
    belongs_to :question_category

    has_many :interview_questions
    has_many :interviews, through: :interview_questions
end
