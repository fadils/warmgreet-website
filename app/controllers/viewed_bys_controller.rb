class ViewedBysController < ApplicationController
  def create
    @viewby = current_user.viewbys.new
    @viewby.review_id = params[:user_id]
    @viewby.view_id = 1

    if @viewby.save
    else
      render json: @viewby.errors.full_messages
    end
  end
end
