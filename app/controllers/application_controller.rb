class ApplicationController < ActionController::Base
  protect_from_forgery

  # Expose these methods to the views
   helper_method :current_user, :current_merchant, :signed_in?

   private

   def current_user
     return nil unless session[:token]
     @current_user ||= User.find_by_session_token(session[:token])
   end

   def get_merchant_number
    return merchant_number
   end

   def current_merchant(user)
    if signed_in?
     return nil unless user.is_merchant?
     @current_merchant = user
    else
     return nil
    end
   end

   def random_user
    @random_user = User.first(:order => "RANDOM()")
   end

   def signed_in?
     !!current_user
   end

   def sign_in(user)
     @current_user = user
     session[:token] = user.reset_session_token!
   end

   def sign_out
     current_user.try(:reset_session_token!)
     session[:token] = nil
   end

   def require_signed_in!
     redirect_to new_session_url unless signed_in?
   end

   def require_signed_out!
     redirect_to user_url(current_user) if signed_in?
   end

   def require_auth!
     redirect_to new_session_url unless current_user.activated == true
   end

   def push_review(review)
     html = render_to_string(partial: "reviews/pusherform", locals: {review: review})
     puts html
     #Pusher.trigger("reviews", "new-review", html)
   end

end
