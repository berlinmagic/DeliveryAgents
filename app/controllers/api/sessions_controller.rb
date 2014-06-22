module Api
  class SessionsController < BaseController
    def create
      if User.find_by_email(params[:email])
        render json: { api_token: "valid token" }
      else
        render json: { status: "Unauthorized" }, status: 403
      end
    end
  end
end
