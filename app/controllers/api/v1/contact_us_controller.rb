module Api
	module V1
    class ContactUsController < ApplicationController
      skip_before_action :verify_authenticity_token

			def index
				render json: ContactUs.all
			end

			def show
				render json: ContactUs.find(params[:id])
      end
      
      def create
        contact = ContactUs.new(permit_params)
        if contact.save
          render json: contact
        end
      end

      def permit_params
        # whitelist params
        params.permit(:inquire_type, :company_name, :position, :name, :furigana_name, :email, :phone, :content)
      end
		end
	end
end