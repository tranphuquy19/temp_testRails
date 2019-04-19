class ExamsController < ApplicationController
    def show
        @title = "Exam"
        begin
            @current_user = current_user.id
        rescue => exception
            redirect_to home_path
        else
            us = User.find(@current_user).role 
            if us==2
                redirect_to home_path
            end
        end
        @exam_id = TestPaper.last.exam_id
        @test_session_id = TestPaper.last.test_session_id
    end

    def create
       _answers = params[:answers]
       _point = params[:point]
       TestPaper.last.update(content:_answers, point:_point )
       redirect_to home_path


    end
    
end
