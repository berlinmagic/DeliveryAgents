module Api
  class SessionsController < BaseController
    def create
      if user = User.find_by_email(params[:email])
        render json: user
      else
        render json: { status: "Unauthorized" }, status: 403
      end
    end
  end
end
