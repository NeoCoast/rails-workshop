# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  before_action :load_user, only: %i[follow followers followees]

      def create
        @user = User.create!(user_params)
      end

      def index
        @users = User.all
      end

      def show
        @user = User.find params[:id]
      end

      def follow
        @user.follow(params[:followee_id])

        head :ok
      end

      def followers
        @users = @user.followers

        render :index
      end

      def followees
        @users = @user.followees
        
        render :index
      end

      private

      def user_params
        params.permit(:email, :username)
      end

      def load_user
        @user = User.find(params[:id])
      end
end
