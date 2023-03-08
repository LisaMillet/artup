class QuestionsController < ApplicationController
  def show
    @user_journey = UserJourney.find(session[:current_user_journey_id])
    @question = Question.find(params[:id])
    piece = @question.piece
    @user_journey_piece = UserJourneyPiece.find_by(piece: piece, user_journey: @user_journey)
    @user_journey_answer = UserJourneyAnswer.new
    authorize @question
  end
end
