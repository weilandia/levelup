module Api
  class ApiController < ApplicationController
    protect_from_forgery with: :null_session
    include JSONAPI::ActsAsResourceController

    def context
      { current_user: current_user }
    end
  end
end
