class Piece < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :journey_pieces, dependent: :destroy
  has_many :user_journey_pieces, dependent: :destroy

  enum status: [:locked, :waiting_for_answer]
  has_one_attached :photo
  has_one_attached :prod_qr_code
  has_one_attached :dev_qr_code

  def fun_facts
    [fun_fact_1, fun_fact_2, fun_fact_3, fun_fact_4, fun_fact_5].compact
  end

end
