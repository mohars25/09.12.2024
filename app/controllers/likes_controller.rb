class LikesController < ApplicationController
    before_action :authenticate_user
  
    def create
      @gossip = Gossip.find(params[:gossip_id])
      @like = @gossip.likes.build(user: current_user)
      if @like.save
        redirect_to gossip_path(@gossip), notice: "Vous avez liké ce potin."
      else
        redirect_to gossip_path(@gossip), alert: "Impossible de liker."
      end
    end
  
    def destroy
      @gossip = Gossip.find(params[:gossip_id])
      @like = @gossip.likes.find(params[:id])
      @like.destroy
      redirect_to gossip_path(@gossip), notice: "Vous avez retiré votre like."
    end
  
    private
  
    def authenticate_user
      redirect_to new_session_path, alert: "Connectez-vous pour liker." unless user_signed_in?
    end
  end
  