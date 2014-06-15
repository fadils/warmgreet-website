class UsersController < ApplicationController
  before_filter :require_signed_in!, :only => [:show, :index]
  before_filter :require_signed_out!, :only => [:create, :new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      sign_in(@user)
      AuthMailer.signup_email(@user).deliver!
      redirect_to user_url(@user)
    else
      render :json => @user.errors.full_messages
    end
  end

  def show
    if params.include?(:id)
      @user = User.find(params[:id])
    else
      redirect_to user_url(current_user)
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update_attributes(params[:user])
      redirect_to profile_show_url(@user)
    else
      render :json => @user.errors.full_messages
    end
  end

  def index
    @users = User.all
    @thumb_stories = Review.all
    @thumb_stories.sort! {|a,b| a.vote_tags.count <=> b.vote_tags.count}
    @users.sort! { |a,b| a.follows.count <=> b.follows.count }
    @matter_users = Kaminari.paginate_array(@users).page(params[:page])
  end
end
