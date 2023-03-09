class ScannerController < ApplicationController
  def qr_code
    @piece = Piece.find_by(slug: params[:slug])
    authorize(:scanner, :qr_code?)
    redirect_to question_path(@piece.questions.first)
  end
end
