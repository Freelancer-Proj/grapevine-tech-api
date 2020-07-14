module Api
	module V1
		class ReviewsController < ApplicationController
			def index
				render json: Review.all
			end

			def show
				render json: Review.find(params[:id])
			end
		end
	end
end