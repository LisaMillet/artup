class UserJourneyAnswersController < ApplicationController
  def create
    @user_journey = UserJourney.find(params[:user_journey_id])
    @answer = Answer.find(params[:user_journey_answer][:answer_id])
    @user_journey_answer = UserJourneyAnswer.create(user_journey: @user_journey, answer: @answer)
    redirect_to user_journey_path(@user_journey)
  end
end
