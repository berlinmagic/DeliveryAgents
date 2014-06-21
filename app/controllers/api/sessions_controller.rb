module Api
  class SessionsController < ApplicationController
    def create
      render json: { api_token: "valid token" }
    end
  end
end
