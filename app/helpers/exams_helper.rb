module ExamsHelper
    def getAllQuestionID(_exam_id)
        id = _exam_id.to_i
        list_questionID = Exam.find(id).list_questions.split(",")
    end
end
