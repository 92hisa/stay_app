class ReservationsController < ApplicationController
    
    def new
        @post = Post.find_by(id: params[:post_id])
        @reservation = Reservation.new
    end
    
    def create
        @post = Post.find_by(id: params[:post_id])
        @reservation = @post.reservations.build(reservation_params)
        if @reservation.valid? && @reservation.save
            flash[:notice] = "予約が完了しました"
            redirect_to post_reservation_path(id: current_user.id)
        else
            flash[:alert] = "予約できませんでした"
            render 'new'
        end
    end
    
    def show
        @post = Post.find_by(id: params[:post_id])
        @reservation = Reservation.find_by(id: params[:id])
        
        date_diff = Reservation.new()
        
    end
    
    def index
        @reservation_all = current_user.reservations.all
    end
    
    def lending
        @lending = current_user.posts.all
    end
    
    def edit
        @post = Post.find_by(id: params[:post_id])
        @reservation = Reservation.find_by(id: params[:id])
    end
    
    def update
        @post = Post.find_by(id: params[:post_id])
        if @reservation = @post.reservations.update(reservation_params)
            flash[:notice] = "予約の変更が完了しました"
            redirect_to post_reservation_path(id: current_user.id)
        else
            flash[:alert] = "予約の変更ができませんでした"
            render 'edit'
        end
    end
    
    def destroy
        @post = Post.find_by(id: params[:post_id])
        @reservation = Reservation.find_by(id: params[:id])
        if @reservation.destroy
            redirect_to post_reservations_path(id: current_user.id)
            flash[:notice] = "予約のキャンセルが完了しました"
        else
            redirect_to post_reservations_path(id: current_user.id)
            flash[:alert] = "予約のキャンセルができませんでした"
        end
    end
    
    
    private
    
    def reservation_params
        params.require(:reservation).permit(:checkin, :checkout, :people, :post_id).merge(user_id: current_user.id)
    end
end
