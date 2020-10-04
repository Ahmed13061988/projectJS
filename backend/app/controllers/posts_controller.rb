class PostsController < ApplicationController
    def index
        posts = Post.all
        render json: games, except: [:created_at, :updated_at]
    end

    def show
        post = Post.find_by(id: params[:id])
        if post
            render json: posts, except: [:created_at, :updated_at]
        else
            render json: {message: "Game not found."}
        end
    end
end
