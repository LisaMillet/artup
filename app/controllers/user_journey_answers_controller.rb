class UserJourneyAnswersController < ApplicationController

  def create
    @user_journey_piece = UserJourneyPiece.find(params[:user_journey_piece_id])
    @user_journey = @user_journey_piece.user_journey
    @answer = Answer.find(params[:user_journey_answer][:answer_id])
    @question = @answer.question
    @user_journey_answer = UserJourneyAnswer.create!(user_journey_piece: @user_journey_piece, answer: @answer)

    authorize @user_journey_answer
    # binding.pry
    if @question == @user_journey_piece.last_question
      @user_journey_piece.revealed!
      redirect_to user_journey_piece_path(@user_journey_piece), status: :see_other

    else
      @user_journey_piece = @user_journey.next_user_journey_piece if @user_journey_piece.next_question.nil?

      redirect_to question_path(@user_journey_piece.next_question), status: :see_other
    end
  end

end
