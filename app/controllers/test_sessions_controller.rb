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
        # if signed_in?
        #     user = current_user
        #     if user.role == 2
        #     @test_session = TestSession.find(params[:id])
        #     @title = @test_session.content + " edit"
        #     else
        #         redirect_to home_path
        #     end
        # else
        #     redirect_to sign_in_path
        # end
        if isAdmin
            @test_session = TestSession.find(params[:id])
            @title = @test_session.content + " edit"
        else
            redirect_to home_path
        end
    end

    def new
    end


    def update
        
        p params[:contentt]
    end

    def create
    end

    def destroy
    end
end
