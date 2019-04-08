class HomeController < ApplicationController
    def show
        @posts = Post.last(6).reverse
        @tests = TestSession.last(12).reverse
    end
end
