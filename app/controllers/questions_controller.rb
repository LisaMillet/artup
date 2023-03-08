class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @user_journey_answer = UserJourneyAnswer.new
    authorize @question
    raise
  end
end
