class StaticPagesController < ApplicationController
    def home
      @gossips = Gossip.all  # Récupère tous les potins
    end
  end
  