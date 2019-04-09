class TestSessionsController < ApplicationController
    def index
        @title = "Test Sessions"
        @test_sessions = TestSession.last(12).reverse
    end

    def show
        @test_sessions = TestSession.find(params[:id])
        @title = @test_sessions.title
    end

    def edit
        # @test_session = TestSession.find(params[:id])
        # @title = @test_session.title + " edit"
    end

    def update
    end

    def create
    end

    def destroy
    end
end
