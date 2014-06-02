class CategoriesController < ApplicationController

  before_filter :require_signed_in!, :only => [:index]
  before_filter :require_signed_out!, :only => [:create, :new]

  def new
    @category = Category.new
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
      @category = Category.find(params[:id])
    else
      redirect_to category_url(category)
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update_attributes(params[:user])
      redirect_to user_url(@user)
    else
      render :json => @user.errors.full_messages
    end
  end

  def index
    @users = Kaminari.paginate_array(User.all).page(params[:page])
  end
end
