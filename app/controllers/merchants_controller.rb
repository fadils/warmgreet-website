class MerchantsController < ApplicationController
  before_filter :require_signed_in!, :only => [:new]

  def new
    @country = Country.find(params[:country_id])
    @merchant = @country.merchants.new
  end

  def create
    @country = Country.find(params[:country_id])
    @merchant = @country.merchants.new(params[:merchant])

    if @merchant.save
      redirect_to merchant_url(@merchant)
    else
      render :json => @merchant.errors.full_messages
    end
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:id])

    if @merchant.update_attributes(params[:merchant])
      redirect_to merchant_url(@merchant)
    else
      render :json => @merchant.errors.full_messages
    end
  end

  def show
    @merchant = Merchant.find(params[:id])
    #puts '#' * 2000
    #puts @merchant.nil?
    # puts current_user.favorite_places.empty?
    #@fav = Favorite.find_by_user_id(current_user.id)
    #puts @fav.empty?
    # merchant.includes(:reviews, :categories, :city, :state, :users_who_favorited).find(params[:id])
  end

  def index
    #@country = Country.find(params[:country_id])
    @country = Country.find(1)

    @category = Category.all

    @merchants = @country.merchants.select("merchants.*, AVG(reviews.rating) AS avg_rating")
                        .joins("LEFT JOIN reviews ON reviews.merchant_id = merchants.id")
                        .group("merchants.id")
                        .order("avg_rating DESC NULLS LAST")
                        .page(params[:page])
                        .per(5)

    @reviews = Review.select("reviews.*")
                     .joins("JOIN merchants ON reviews.merchant_id = merchants.id")
                     .joins("JOIN countries ON countries.id = merchants.country_id")
                     .where("countries.id = ?", @country.id)
                     .group("reviews.id")
                     .order("reviews.created_at")
                     .last(5)
                     .reverse!
  end

  def destroy
    @merchant = merchant.find(params[:id])

    @merchant.destroy

    redirect_to merchants_url
  end

  def search
    @results = PgSearch.multisearch(params[:query])

    if @results.empty?
      return []
    elsif Category.all.include?(@results.first.searchable)
      @category = @results.first.searchable
        .merchants.where("country_id = 1")
        .sort!{ |a, b| a.average_rating <=> b.average_rating }
        .reverse!

      @merchants = Kaminari.paginate_array(@category)
                             .page(params[:page])
                             .per(10)
    else
      @merchants = @results.map(&:searchable).sort!{ |a, b| a.average_rating <=> b.average_rating }.reverse!

      @merchants = Kaminari.paginate_array(@merchants).page(params[:page]).per(10)
    end

    # @merchants = merchant.includes(:categories).where("city_id = ? AND categories.id = ?", params[:city_id], params[:cat_id]).page(params[:page])
  end

end
