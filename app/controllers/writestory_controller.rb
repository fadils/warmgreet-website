class WritestoryController < ApplicationController
  def write
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
