class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @journeys = Journey.all
  end

  def dashboard
    @user_journeys = UserJourney.where(user: current_user)
  end
end
