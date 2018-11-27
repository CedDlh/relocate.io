class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # @buddy = User.find_by(buddy: true)
    @user = User.new
    @specialties = ["Anmeldung", "Bank Account", "Tax advise"]
  end

  def search
    # raise
  end
end
