class Interview < ActiveRecord::Base
    belongs_to :student
    belongs_to :user
    belongs_to :interviewer, :class_name => "User"

    has_many :interview_question_categories
    has_many :question_categories, through: :interview_question_categories

    has_many :interview_questions
    has_many :questions, through: :interview_questions

    after_create :load_questions

    validates_presence_of :level



    def load_questions
          exam = {}
              if self.level == "medium"
                  exam["easy"] = 6
                  exam["medium"] = 14
              elsif self.level == "hard"
                  exam["easy"] = 4
                  exam["medium"] = 8
                  exam["hard"] = 8
              elsif self.level== "easy"
                  exam["easy"] = 20
              end
              question_category_ids = self.question_categories.pluck(:id) #Checks with the
              question_category_ids.each do |category_id|
                   exam.each do |key,value|
                       questions = Question.where('question_category_id = ? AND level = ?', category_id, key).order("RANDOM()").limit(value)
                       questions.each do |question|
                             int = InterviewQuestion.new
                             int.question_id = question.id
                             int.interview_id = self.id
                             int.save
                       end
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
