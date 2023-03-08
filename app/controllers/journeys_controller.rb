class JourneysController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def show
    @journey = Journey.find(params[:id])
    @user_journey = UserJourney.new
    authorize @journey
  end
end
