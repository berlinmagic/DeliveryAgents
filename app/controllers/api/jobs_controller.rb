module Api
  class JobsController < BaseController
    def index
      builder = MockJobBuilder.new
      jobs = [].tap { |j| 10.times { j << builder.build } }
      render json: { jobs: jobs }
    end

    private

    class MockJobBuilder
      def initialize
        @index = 0
      end

      def build
        @index += 1
        offset_lat = rand(0.0001) % 0.005
        offset_lon = rand(0.0001) % 0.005
        {
          id: @index, date: DateTime.new,
          client: { name: "Client #{@index}" },
          location: { lat: 52.517561 + offset_lat, lon: 13.414685 + offset_lon }
        }
      end
    end
  end
end
