module Api
  module V1
    class UsersController < ApiController

      private
        def set_user
          @user = User.find(params[:user_id])
        end
    end
  end
end
