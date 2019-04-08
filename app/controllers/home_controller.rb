class HomeController < ApplicationController
    def show
        @title = "Home"
        @posts = Post.last(6).reverse
        @tests = TestSession.last(12).reverse
    end
end
