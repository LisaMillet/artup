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
      redirect_to user_journey_path(@user_journey)
    else
      render root_path, status: :unprocessable_entity
    end
  end

end
