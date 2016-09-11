class LinksController < ApplicationController
  def index
    @links = current_user.links
  end

  def create
    link = Link.new(user: current_user, url: link_params["url"], title: link_params["title"])
    if link.save
      
    else
    end
  end

  private
  def link_params
    params.require("link").permit(:url, :title)
  end
end
