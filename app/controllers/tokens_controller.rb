class TokensController < ApplicationController

  def create
    
    identify = current_user.email

    grant = Twilio::JWT::AccessToken::ChatGrant.new
    grant.service_sid = ENV['TWILIO_CHAT_SERVICE_SID']

    token = Twilio::JWT::AccessToken.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_API_KEY'],
      ENV['TWILIO_API_SECERT'],
      [grant],
      identify: identify
      )

    render json: { identify: identify, token: token.to_jwt }

  end

end