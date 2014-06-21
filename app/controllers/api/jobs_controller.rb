module Api
  class JobsController < ApplicationController
    def index
      render json: [
        { id: 1, client_name: "Client 1", date: Date.today + 2 },
        { id: 2, client_name: "Client 1", date: Date.today + 3 },
        { id: 3, client_name: "Client 1", date: Date.today + 3 },
        { id: 4, client_name: "Client 1", date: Date.today + 4 }
      ]
    end
  end
end
