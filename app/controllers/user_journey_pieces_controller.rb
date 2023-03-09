class UserJourneyPiecesController < ApplicationController

  def show
    @user_journey_piece = UserJourneyPiece.find(params[:id])
    @user_journey = @user_journey_piece.user_journey

    authorize @user_journey_piece
    if @user_journey_piece.waiting_for_answer?
      redirect_to question_path(@user_journey_piece.piece.questions.first)
    else
      render :show
    end
  end

  def unlock
    @user_journey_piece = UserJourneyPiece.find(params[:id])
    authorize @user_journey_piece
    @piece = @user_journey_piece.piece
    @piece.waiting_for_answer!
    redirect_to question_path(@piece.questions.first)
  end
end
