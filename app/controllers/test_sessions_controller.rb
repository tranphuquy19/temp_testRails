class TestSessionsController < ApplicationController
    include ApplicationHelper
    def index
        @title = "Test Sessions"
        @test_sessions = TestSession.last(18).reverse
    end

    def show
        @test_session = TestSession.find(params[:id])
        @title = @test_session.content
    end

    def edit
        if isAdmin
            @test_session = TestSession.find(params[:id])
            @title = @test_session.content + " edit"
            @time_public = dateTimeToTimePicker(@test_session.time_public)
        else
            redirect_to home_path
        end
    end

    def new
    end


    def update
        if checkAuth
        pars = params[:session]
        # ts = TestSession.find(pars[:id])
        # ts.update()
        case pars[:options]
        when "properties"
            ts = TestSession.find(pars[:id])
            ts.update_attributes(content: pars[:content], user_id: User.find_by(email: pars[:user]).id, time_remaining: pars[:time_remaining], time_public: timePickerToDateTime(pars[:time_public]))
        when "exams"
        when "members"
        end
        end
    end

    def create
    end

    def destroy
    end
end
