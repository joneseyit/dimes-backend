require 'twilio-ruby'

class TwilioController < ApplicationController
    include Webhookable
    after_action :set_header
    skip_before_action :authorized

   


    def text
        account_sid = 'ACc44acca70d5da10ea2acfc1291f35809'
        auth_token = '9d2e2bfa5c486a460baf6fdf23efad3b'
        @client = Twilio::REST::Client.new account_sid, auth_token
        message = @client.messages.create(
            body: "Hey this is Jones",
            to: '+18016689499',
            from: '+14353392671'
        )

        puts message.sid
    end

end