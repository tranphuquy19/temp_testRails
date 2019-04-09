class HomeController < ApplicationController
    def show
        @title = "Home"
        @posts = Post.last(8).reverse
        @tests = TestSession.last(12).reverse
    end
end
