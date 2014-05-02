class SessionsController < ApplicationController
  before_filter :require_signed_out!, :only => [:new, :create]
  before_filter :require_signed_in!, :only => [:destroy]

  def new
  end

  def create

    if request.env['omniauth.auth']
      user = User.find_uid_or_create(request.env['omniauth.auth'])
    else
      user = User.find_by_credentials(
        params[:user][:username],
        params[:user][:password])
    end

    if user
      sign_in(user)
      Keen.publish(:sign_ins, {:username => "#{user.username}", :time => "#{Time.new.inspect}" })
      #redirect_to "/merchants/index"
      redirect_to user_url(current_user)
    else
      render :json => "Credentials were wrong"
    end
  end

  def destroy
    sign_out
    Keen.publish(:sign_outs, {:username => user.username, :time => "#{Time.new.inspect}" })
    puts "****************Just sign out*******************"
    redirect_to new_session_url
  end
end
