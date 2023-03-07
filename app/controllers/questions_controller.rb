class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @user_journey_answers = UserJourneyAnswer.new
  end
end
