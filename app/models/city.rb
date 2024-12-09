class City < ApplicationRecord
    # Une ville peut avoir plusieurs utilisateurs
    has_many :users
  
    # Tu peux ajouter des validations si besoin, par exemple :
    validates :name, presence: true, uniqueness: true
  end
  