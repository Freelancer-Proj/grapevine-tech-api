module Api
	module V1
		class ReviewsController < ApplicationController
			skip_before_action :verify_authenticity_token
			def index
				render json: Review.all
			end

			def show
				render json: Review.find(params[:id])
			end
		end
	end
end