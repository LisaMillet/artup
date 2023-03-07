class UserJourneys::PiecesController < ApplicationController

  def show
    @user_journey = UserJourney.find(params[:user_journey_id])
    @piece = Piece.find(params[:id])
    authorize @piece
  end

end
