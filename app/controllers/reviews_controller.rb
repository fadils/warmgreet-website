class ReviewsController < ApplicationController
  before_filter :require_signed_in!

  def new
    @review = Review.new
    @merchant = Merchant.find(params[:merchant_id])
    if @merchant.open == false
      render json: "That merchant is closed!"
    end
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    @review = current_user.reviews.new(params[:review])
    @review.merchant_id = @merchant.id
    @review.save

    @merchant.average_rating
    @merchant.update_attributes(params[:merchant_avg_rtg])

    #push_review(@review)

    if request.xhr?
      headers["Content-Type"] = 'text/html; charset=utf-8'
      render partial: "jsform", locals: {review: @review}
    else
      redirect_to merchant_url(@review.merchant)
    end

    # else
    #   render json: @review.errors.full_messages
    # end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = current_user.reviews.find(params[:id])
  end

  def update
    @review = current_user.reviews.find(params[:id])

    if @review.update_attributes(params[:review])
      redirect_to profile_show_url(@review.user)
    else
      render json: @review.errors.full_messages
    end
  end

  def index
    @reviews = Review.all
  end

  def destroy
    @review = Review.find(params[:id])

    if (current_user.admin == true && !current_user.reviews.include?(@review))
      @review.destroy
      redirect_to merchant_url(@review.merchant)
    else
      @review.destroy
      redirect_to profile_show_url(@review.user)
    end
  end
end
