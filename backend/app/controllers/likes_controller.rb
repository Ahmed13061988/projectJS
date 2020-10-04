class LikesController < ApplicationController
    def new
        like = Like.new
    end

    def create
        like = Like.new(like_params)
        # current_user.favorite.build(favorite_params)
        if like.save
            render json: like, except: [:created_at, :updated_at]
        else
            render json: {message: "Favorite Failed"}
        end
    end

    def index
        user_id = params[:user_id]
        user = User.find(user_id)
        likes = user.likes
        render json: likes, include: [:post]
        # rendering related object data in JSON by nesting models
        # result:
          #       {
          # "id": 2,
          # "user_id": 1,
          # "game": {
          #   "id": 4,
          #   "title": "",
          #   "category": "",
          #   "created_at": "2019-05-14T11:20:37.177Z",
          #   "updated_at": "2019-05-14T11:20:37.177Z"
          # }
    end

    def destroy
        lik_id = params[:id]
        like = Like.find(lik_id)
        like.destroy
    end


private
    def like_params
      params.require(:like).permit(:user_id, :post_id)
    end
end
