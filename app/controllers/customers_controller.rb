class CustomersController < ApplicationController
  before_filter :require_signed_in!, :only => [:show, :index]
  before_filter :require_signed_out!, :only => [:create, :new]

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params[:user])

    if @customer.save
      sign_in(@customer)
#      AuthMailer.signup_email(@user).deliver!
      redirect_to customer_url(@customer)
    else
      render :json => @customer.errors.full_messages
    end
  end

  def show
    if params.include?(:id)
      @customer = Customer.find(params[:id])
    else
      redirect_to customer_url(current_customer)
    end
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer

    if @customer.update_attributes(params[:customer])
      redirect_to customer_url(@customer)
    else
      render :json => @customer.errors.full_messages
    end
  end

  def index
    @customers = Kaminari.paginate_array(Customer.all).page(params[:page])
  end
end
