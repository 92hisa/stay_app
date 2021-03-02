class PostsController < ApplicationController
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to root_path
            flash[:notice] = "投稿が保存されました"
        else
            redirect_to new_post_path
            flash[:alert] = "投稿に失敗しました"
        end
    end
    
    def show
        @post = Post.find_by(id: params[:id])
    end
    
    def index
        @post = Post.order('created_at DESC')
    end
    
    def search
        if params[:search]
            @search = Post.where('prefecture LIKE ?', "%#{params[:search]}%")
        else
            @search = Post.all
        end
    end
    
    private
    
    def post_params
        params.require(:post).permit(:caption, :room_name, :room_intro, :price, :prefecture, :city).merge(user_id: current_user.id)
    end
    
end
