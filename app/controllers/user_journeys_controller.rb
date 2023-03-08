class UserJourneysController < ApplicationController
  def show
    @user_journey = UserJourney.find(params[:id])
    authorize @user_journey
  end

  def create
    @journey = Journey.find(params[:journey_id])
    @user_journey = UserJourney.new
    @user_journey.journey = @journey
    @user_journey.user = current_user
    authorize @user_journey
    if @user_journey.save
      session[:current_user_journey_id] = @user_journey.id
      redirect_to question_path(@user_journey.pieces.first.questions.first)
    else
      render root_path, status: :unprocessable_entity
    end
  end

  def quit
    @user_journey = UserJourney.find(params[:id])
    authorize @user_journey
    @user_journey.status = false
    @user_journey.save
    redirect_to user_journey_path(@user_journey)
  end
end
