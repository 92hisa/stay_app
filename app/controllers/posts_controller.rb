class PostsController < ApplicationController
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to list_user_path(id: current_user)
            flash[:notice] = "投稿が保存されました"
        else
            redirect_to new_post_path
            flash[:alert] = "投稿に失敗しました"
        end
    end

    
    def show
        @post = Post.find_by(id: params[:id])
    end
    
    
    def edit
        @post = Post.find_by(id: params[:id])
    end
    
    
    def update
        @post = Post.find_by(id: params[:id])
        if @post.update(post_params)
            flash[:notice] = "変更が保存されました"    
            redirect_to list_user_path(current_user.id)
        else
            flash[:alert] = "変更できませんでした"
            render :edit
        end
    end
    
    def destroy
        @post = Post.find_by(id: params[:id])
        
        if @post.destroy
        flash[:notice] = "掲載を削除しました"    
        redirect_to list_user_path(id: current_user)
        else
        flash[:alert] = "掲載を削除できませんでした"   
        render :edit
        end
    end
    
    
    def index
        @post = Post.order('created_at DESC')
    end
    
    def search
        if params[:search]
            @search = Post.where('city LIKE ?', "%#{params[:search]}%")
        else
            @search = Post.all
        end
    end
    
    private
    
    def post_params
        params.require(:post).permit(:caption, :room_name, :room_intro, :price, :city).merge(user_id: current_user.id)
    end
    
end
