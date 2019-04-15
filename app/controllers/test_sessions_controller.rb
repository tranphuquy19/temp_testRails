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
        if isAdmin
            @title = " Create new Test Session"
        else
            redirect_to home_path
        end
    end


    def update
        if checkAuth
            pars = params[:session]
            ts = TestSession.find(pars[:id])
            if pars[:submit] == "delete"
                TestSession.find(pars[:id]).destroy
                redirect_to home_path
            else            
                case pars[:options]
                when "properties"
                    ts.update_attributes(content: pars[:content], user_id: User.find_by(email: pars[:user]).id, time_remaining: pars[:time_remaining], time_public: timePickerToDateTime(pars[:time_public]))
                when "exams"
                    list_exams = pars[:list_exams].split("\r\n")
                    le = []
                    list_exams.each do |title|
                    le.push Exam.find_by(title: title).id
                    end
                    ts.update_attributes(list_exams: le.join(","))
                when "members"
                    emails = pars[:list_members].split("\r\n")
                    sm = ts.session_members.destroy_all
                    emails.each do |email|
                        SessionMember.create(user_id: User.find_by(email: email).id, test_session_id: 11)
                        #add_feature=> try-catch if User (:email) not found
                    end
                end
            end
        end
    end

    def create
        if isAdmin
            pars = params[:session]
            le = pars[:list_exams].split("\r\n").join(",")
            lm = pars[:list_members].split("\r\n")
            u = current_user.test_sessions.create(content: pars[:content], list_exams: le, time_public: timePickerToDateTime(pars[:time_public]), time_remaining: pars[:time_remaining], category_id: pars[:category_id].to_i)
            lm.each do |email|
                SessionMember.create(user_id: User.find_by(email: email).id, test_session_id: u.id)
            end
        else
            redirect_to home_path
        end
    end

    def destroy
    end
end
