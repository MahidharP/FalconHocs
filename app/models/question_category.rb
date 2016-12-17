class QuestionCategory < ActiveRecord::Base
    has_many :questions

    has_many :interview_question_categories
    has_many :interviews, through: :interview_question_categories
end
