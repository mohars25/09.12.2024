class CommentsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @gossip = Gossip.find(params[:gossip_id])
      @comment = @gossip.comments.new(comment_params)
      @comment.user = current_user
  
      if @comment.save
        redirect_to gossip_path(@gossip), notice: 'Commentaire ajouté avec succès !'
      else
        render 'gossips/show'
      end
    end
    
    def destroy
      @comment = Comment.find(params[:id])
      @gossip = @comment.gossip
      @comment.destroy
      redirect_to gossip_path(@gossip), notice: 'Commentaire supprimé avec succès !'
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  