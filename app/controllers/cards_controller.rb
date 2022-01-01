class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def show
    logger.debug "in show method"
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      redirect_to @card
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logger.debug "in destroy method"
    @card = Card.find(params[:id])
    @card.destroy

    redirect_to root_path
  end

private
  def card_params
    params.require(:card).permit(:body)
  end

end
