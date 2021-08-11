module Api
  module V1
    class ProgramsController < ApplicationController
      def index
        render json: Program.all
      end
    end
  end
end