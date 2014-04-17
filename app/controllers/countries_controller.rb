class CountriesController < ApplicationController

  def index
    @countries = Country.includes(:state).all
  end

  def show

  end

end
