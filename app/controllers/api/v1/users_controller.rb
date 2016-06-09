module Api
  module V1
    class UsersController < ApiController
      respond_to :json

      def show
        respond_with User.find(params[:id])
      end

      private
        def set_user
          @user = User.find(params[:user_id])
        end
    end
  end
end
