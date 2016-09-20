class Api::V1::LinksController < ApplicationController
  respond_to :json

  def index
    links =  Link.where(user_id: current_user.id)
    respond_with links
  end

  def create
    link = current_user.links.new(link_params)
    if link.save
      respond_with(link, status: 201, location: api_v1_links_path)
    else
      respond_with({ errors: link.errors }, status: 422, location: api_v1_links_path)
    end
  end

  def update
    link = Link.find(params[:id])
    if link.update(link_params)
      render json: link
    else
      respond_with({ errors: link.errors }, status: 422, location: api_v1_links_path)
    end
  end

  private
  def link_params
    params.require("link").permit(:url, :title, :read)
  end
end
