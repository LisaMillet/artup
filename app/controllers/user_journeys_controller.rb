class UserJourneysController < ApplicationController
  def show
    @user_journey = UserJourney.find(params[:id])
  end

  def create
    @journey = Journey.find(params[:journey_id])
    @user_journey = UserJourney.new(user_journey_params)
    @user_journey.journey = @journey
    @user_journey.user = current_user
    authorize @user_journey
    if @user_journey.save
      redirect_to user_journey_path_(@user_journey)
    else
      render root_path, status: :unprocessable_entity
    end
  end

  private

  def user_journey_params
    params.require(:user_journey).permit(:journey_id, :user_id, :score)
  end
end
