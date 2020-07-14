module Api
	module V1
		class StaffsController < ApplicationController
			def index
				render json: Staff.all
			end

			def show
				render json: Staff.find(params[:id])
			end
		end
	end
end