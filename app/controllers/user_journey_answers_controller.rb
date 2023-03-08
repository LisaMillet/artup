class UserJourneyAnswersController < ApplicationController
  def create
    @user_journey_piece = UserJourneyPiece.find(params[:user_journey_piece_id])
    @user_journey = @user_journey_piece.user_journey
    @answer = Answer.find(params[:user_journey_answer][:answer_id])
    @user_journey_answer = UserJourneyAnswer.create(user_journey_piece: @user_journey_piece, answer: @answer)
    redirect_to user_journey_path(@user_journey)
    authorize @user_journey_answer
  end
end
