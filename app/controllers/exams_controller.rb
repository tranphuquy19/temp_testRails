class ExamsController < ApplicationController
    include ApplicationHelper
    def show


        if allow_examinations
            @test_session_id = TestPaper.last.test_session_id
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
