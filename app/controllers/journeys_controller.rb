class JourneysController < ApplicationController
  def show
    @journey = Journey.find(params[:id])
    authorize @journey
  end
end
