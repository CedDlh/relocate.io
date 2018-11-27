class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @buddy = User.all
  end

  def search
    #raise
  end
end
