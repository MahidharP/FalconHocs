class Interview < ActiveRecord::Base
    belongs_to :student
    belongs_to :user

    has_many :interview_question_categories
    has_many :question_categories, through: :interview_question_categories

    has_many :interview_questions
    has_many :questions, through: :interview_questions

    after_create :load_questions



    def load_questions
      quest = self.question_categories.pluck(:id)
      quest.each do |que|
          question = Question.where('question_category_id == ?', que)
          questi = question.order('RANDOM()').limit(5)
          questi.each do |q|
              int = InterviewQuestion.new
              int.question_id = q.id
              int.interview_id = self.id
              int.save
          end
       end

      #Using Comparision 

      # quest.each do |ques|
      # if ques == 1
      #   question = Question.where('question_category_id == ?', 1)
      #   que = question.order('RANDOM()').limit(5)
      #   que.each do |q|
      #     int = InterviewQuestion.new
      #     int.question_id = q.id
      #     int.interview_id = self.id
      #     int.save
      #   end
      # elsif ques == 2
      #   question = Question.where('question_category_id == ?', 2)
      #   que = question.order('RANDOM()').limit(5)
      #   que.each do |q|
      #     int = InterviewQuestion.new
      #     int.question_id = q.id
      #     int.interview_id = self.id
      #     int.save
      #   end
      # end
      # end

      #Just to create a random records in the database

      # que = Question.order('RANDOM()').limit(5)
      # que.each do |q|
      #     int = InterviewQuestion.new
      #     int.question_id = q.id
      #     int.interview_id = self.id
      #     int.save
      # end
  end
end
