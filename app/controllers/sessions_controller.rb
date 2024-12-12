class SessionsController < ApplicationController
  def new
    # Action pour afficher le formulaire de connexion
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Connexion réussie !'
    else
      flash.now[:alert] = 'Email ou mot de passe incorrect'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Déconnexion réussie !'
  end
end
