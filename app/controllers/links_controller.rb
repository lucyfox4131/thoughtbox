class LinksController < ApplicationController
  def index
    @links = current_user.links
  end

  def create
    
  end
end
