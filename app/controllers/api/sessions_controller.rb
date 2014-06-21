module Api
  class SessionsController < BaseController
    def create
      render json: { api_token: "valid token" }
    end
  end
end
