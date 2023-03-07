class User < ApplicationRecord
  has_many :user_journeys, dependent: :destroy

  def current_user_journey
    user_journeys.last || user_journeys.create
  end
end
