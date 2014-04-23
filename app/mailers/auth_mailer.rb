class AuthMailer < ActionMailer::Base
  default from: "fadil@warmgreet.com"

  def signup_email(customer)
    @customer = customer
    @token = @customer.auth_token
    #@url = "http://isthatanygood.com/users/#{@user.id}/activate?auth_token=#{@token}"

    mail(
      to: "fsutomo@gmail.com",
      subject:'We just signup!'
    )
  end

end
