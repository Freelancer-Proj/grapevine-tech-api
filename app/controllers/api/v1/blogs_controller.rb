module Api
	module V1
		class BlogsController < ApplicationController
			skip_before_action :verify_authenticity_token
			def index
				render json: Blog.all
			end

			def show
				render json: Blog.find(params[:id])
			end
		end
	end
end