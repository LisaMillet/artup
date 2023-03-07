class PiecesController < ApplicationController

  def show
    @piece = Piece.find(params[:id])
    authorize @piece
  end
end
