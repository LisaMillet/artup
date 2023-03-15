class UserJourneyAnswersController < ApplicationController

  def create
    @user_journey_piece = UserJourneyPiece.find(params[:user_journey_piece_id])
    @user_journey = @user_journey_piece.user_journey
    @answer = Answer.find(params[:user_journey_answer][:answer_id])
    @question = @answer.question
    @user_journey_answer = UserJourneyAnswer.create!(user_journey_piece: @user_journey_piece, answer: @answer)

    authorize @user_journey_answer
    # binding.pry

    @user_journey_piece.revealed! if @question == @user_journey_piece.last_question

    continue_btn_path = if @question == @user_journey_piece.last_question
                          user_journey_piece_path(@user_journey_piece)
                        else
                          @user_journey_piece = @user_journey.next_user_journey_piece if @user_journey_piece.next_question.nil?
                          question_path(@user_journey_piece.next_question)
                        end

    render json: { answer_is_right: @answer.right_answer?, html: render_to_string(partial: 'questions/answered_show', locals: { question: @question, continue_btn_path: continue_btn_path, clicked_answer: @answer }, formats: :html) }
    # if @question == @user_journey_piece.last_question
    #   @user_journey_piece.revealed!
    #   redirect_to user_journey_piece_path(@user_journey_piece), status: :see_other

    # else
    #   @user_journey_piece = @user_journey.next_user_journey_piece if @user_journey_piece.next_question.nil?

    #   redirect_to question_path(@user_journey_piece.next_question), status: :see_other
    # end
  end

end
