class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @user = User.new
    @specialties = ["Anmeldung", "Bank Account", "Tax advise"]
    @title = "RELOCATE TO BERLIN"
    @subtitle = "Find a BUDDY to relocate & onboard you to Berlin"
  end

  def search
    # raise
  end
end
