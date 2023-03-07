class JourneysController < ApplicationController
  def show
    @journey = Journey.find(params[:id])
    @user_journey = UserJourney.new
    authorize @journey
  end
end
