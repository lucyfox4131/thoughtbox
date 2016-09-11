class LinksController < ApplicationController
  def index
    @links =  Link.where(user_id: current_user.id)
  end

  def create
    link = Link.new(user: current_user, url: link_params["url"], title: link_params["title"])
    if link.save
      flash[:notice] = "Link Created"
    else
      flash[:error] = link.errors.full_messages.join(", ")
    end
    redirect_to links_path
  end

  private
  def link_params
    params.require("link").permit(:url, :title)
  end
end
