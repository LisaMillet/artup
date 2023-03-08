class QuestionsController < ApplicationController
  def show
    @user_journey = UserJourney.find(session[:current_user_journey_id])
    @question = Question.find(params[:id])
    @user_journey_piece = @user_journey.pieces.find(piece: @question.piece)
    @user_journey_answer = UserJourneyAnswer.new
    authorize @question
  end
end
