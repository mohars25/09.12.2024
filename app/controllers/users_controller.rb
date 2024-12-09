class UsersController < ApplicationController
    def show
      @user = User.find(params[:id]) # Trouve un utilisateur spécifique
    end
  end
  