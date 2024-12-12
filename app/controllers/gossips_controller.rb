class GossipsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def new
    @gossip = current_user.gossips.new
  end
  
  def create
    @gossip = current_user.gossips.new(gossip_params)
    if @gossip.save
      redirect_to @gossip, notice: 'Potin créé avec succès !'
    else
      render :new
    end
  end

  def index
    @gossips = Gossip.all
  end

  def edit
    @gossip = Gossip.find(params[:id])
    authorize_user!(@gossip)
  end
  
  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to @gossip, notice: 'Potin mis à jour avec succès !'
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    authorize_user!(@gossip)
    @gossip.destroy
    redirect_to root_path, notice: 'Potin supprimé avec succès !'
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

  def authorize_user!(gossip)
    redirect_to root_path, alert: 'Action non autorisée' unless current_user == gossip.user
  end
end
