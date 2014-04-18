class FavoritesController < ApplicationController

  def create
    @merchant = Merchant.find(params[:merchant_id])
    @favorite = current_user.favorites.new
    @favorite.merchant_id = @merchant.id
    @favorite.save

    if request.xhr?
      headers["Content-Type"] = 'text/html; charset=utf-8'
      render "merchants/show"
    else
      redirect_to merchant_url(@favorite.merchant)
    end
  end

  def destroy
    @merchant = Merchant.find(params[:merchant_id])
    @favorite = current_user.favorites.where("merchant_id = ?", @merchant.id)
    @favorite.first.destroy

    if request.xhr?
      headers["Content-Type"] = 'text/html; charset=utf-8'
      render "merchants/show"
    else
      redirect_to merchant_url(@favorite.first.merchant)
    end
  end

end
