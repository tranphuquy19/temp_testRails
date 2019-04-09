class TestSessionsController < ApplicationController
    def index
        @title = "Test Sessions"
        @test_sessions = TestSession.last(18).reverse
    end

    def show
        @test_sessions = TestSession.find(params[:id])
        @title = @test_sessions.content
    end

    def edit
        @test_session = TestSession.find(params[:id])
        @title = @test_session.content + " edit"
    end

    def new
    end

    def update
    end

    def create
    end

    def destroy
    end
end
