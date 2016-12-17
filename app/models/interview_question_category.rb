class InterviewQuestionCategory < ActiveRecord::Base
    belongs_to :interview
    belongs_to :question_category
end
