module Api
  module V1
    class UserServicesController < ApiController
      before_action :set_user
      def create
        ServiceAdder.create(@user, params)
      end

      private
        def set_user
          @user = User.find(params[:user_id])
        end
    end
  end
end
