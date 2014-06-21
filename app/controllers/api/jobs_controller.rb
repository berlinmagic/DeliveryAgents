module Api
  class JobsController < BaseController
    def index
      builder = MockJobBuilder.new
      jobs = [].tap { |j| 10.times { j << builder.build } }
      render json: jobs
    end

    private

    class MockJobBuilder
      def initialize
        @index = 0
      end

      def build
        @index += 1
        offset = rand(0.0001) % 0.0002
        {
          id: @index, date: DateTime.new + @index,
          client: { name: "Client #{@index}" },
          location: { lat: 52.535389 + offset, lon: 13.201322 + offset }
        }
      end
    end
  end
end
