class PostsController < ApplicationController
    def markdown
        @post = Post.find_by_id(params[:id])
        render plain: @post.content
    end

    def index
        @title = "Posts"
        @posts = Post.last(12).reverse
    end

    def show
        post = Post.find_by_id(params[:id])
        @post = post
        @title = post.user.name + " post"
        @url = "http://localhost:3000/posts/"+params[:id]+"/md"
    end

    def update
    end

    def create
    end

    def destroy
    end
end
