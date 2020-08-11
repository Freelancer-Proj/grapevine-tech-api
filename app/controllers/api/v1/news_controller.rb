module Api
	module V1
		class NewsController < ApplicationController
			skip_before_action :verify_authenticity_token
			def index
				@new = New.all.page params[:page]
				render json: { new: @new, meta: { total_page: @new.total_pages, records: New.count } }
			end
		end
	end
end