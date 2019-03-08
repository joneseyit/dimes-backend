class ApplicationController < ActionController::API
    def
        encoded_token(payload)
        JWT.encode(payload, 'en')
    end

    def decoded_token(token)
        JWT.decode(token, 'en')[0]
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'en', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end
end
