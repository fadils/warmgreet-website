class WritestoryController < ApplicationController
  def write
  	@country = Country.find(1)
    @merchant = @country.merchants.new
    @merchants = Merchant.all
    @merchants.sort! { |a,b| a.reviews.count <=> b.reviews.count }
    @popular_merchants = Kaminari.paginate_array(@merchants).page(params[:page])
  end
end
