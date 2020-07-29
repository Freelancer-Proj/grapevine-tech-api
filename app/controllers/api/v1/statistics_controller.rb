module Api
	module V1
		class StatisticsController < ApplicationController
			skip_before_action :verify_authenticity_token
			def index
				render json: Statistic.all
			end

			def show
				render json: Statistic.find(params[:id])
			end
		end
	end
end