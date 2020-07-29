module Api
	module V1
		class StaffsController < ApplicationController
			skip_before_action :verify_authenticity_token
			def index
				render json: Staff.all
			end

			def show
				render json: Staff.find(params[:id])
			end
		end
	end
end