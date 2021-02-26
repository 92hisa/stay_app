class ReservationsController < ApplicationController
    
    def new
        @reservation = Reservation.new
    end
    
    def create
        @reservation = Reservaton.new(reservation_params)
        if @reservation.save
            redirect_to post_reservation_path(id: current_user)
            flash[:notice] = "予約が完了しました"
        else
            redirect_to new_post_reservation_path
            flash[:alert] = "予約できませんでした"
        end
    end
    
    private
    
    def reservation_params
        params.require(:reservation).permit(:checkin, :checkput, :people)
    end
end
