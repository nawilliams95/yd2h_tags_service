class WelcomeController < ApplicationController
    def index
        render json: { status: 200, message: "Tagging Service  API" }
      end
end
