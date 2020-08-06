class UsersController < ApplicationController
    before_action :authenticate_user
    before_action :set_user, only: [:show, :update, :destroy]
    load_and_authorize_resource
    
    def show
        # @user = User.find(params[:id])
    end

end
