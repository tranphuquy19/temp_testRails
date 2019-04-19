module ExamsHelper
    def getAllQuestionID(_exam_id)
        id = _exam_id.to_i
        list_questionID = Exam.find(id).list_questions.split(",")
    end

    def getTimeRemaining(_exam_id)
        id = _exam_id.to_i
        tsid = Exam.find(id).test_sessions.ids   
        timeRemaining = TestSession.find(tsid[0]).time_remaining * 60
    end

    def getCorrectAnwsers(_exam_id)
        id = _exam_id.to_i
        list_questions = Exam.find(id).list_questions.split(",")
        list_anwsers = []
        list_questions.each do |li|
            temp = li.to_i
            list_anwsers.push(Question.find(temp).key)
        end
        return list_anwsers 
    end



    

end
