class ExamsController < ApplicationController
    def show
        @title = Exam 
        @test_session_id = TestPaper.last.test_session_id
        if allow_examinations
            redirect_to exams_path
            
        else
            redirect_to home_path
            
        end
    end
    
    def create
       _answers = params[:answers]
       _point = params[:point]
       TestPaper.last.update(content:_answers, point:_point )
       redirect_to home_path
    end
    
end
