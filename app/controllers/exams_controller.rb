class ExamsController < ApplicationController
    include Clearance::Controller
    def show
        @title = Exam 
        @test_session_id = TestPaper.last.test_session_id
        @timeRemaining = 0
        if allow_examinations
            public_time = TestSession.find(@test_session_id).time_public.utc
            current_time = Time.now.utc
            @timeRemaining = (current_time-public_time).to_i
        else
            redirect_to home_path
        end
    end

    def allow_examinations
        if signed_in?
            if SessionMember.where(user_id: current_user.id, test_session_id: @test_session_id).exists?
                return true
            else
                return false
            end
        else
            return false
        end
    end

    def create
       redirect_to home_path
    end

    def final_exam
        point = params[:point]
        answers = params[:answers]
        tp = TestPaper.where(user_id = current_user.id,test_session_id:@test_session_id)
        tp.update(content:answers, point:point)
    end

    
end
