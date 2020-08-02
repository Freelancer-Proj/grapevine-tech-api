module Api
	module V1
		class PortfoliosController < ApplicationController
			skip_before_action :verify_authenticity_token
			def index
				render json: Portfolio.all
			end

			def show
				render json: Portfolio.find(params[:id])
			end
		end
	end
end