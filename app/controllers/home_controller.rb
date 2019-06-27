class HomeController < ApplicationController
  before_action :list_params,

  def index
    @list = Film.all.order("episode_id ASC")
  end

  def search
    # @list = api_request 'films', keyword: list_params[:keyword]
    @list = Film.where("title LIKE ? OR episode_id LIKE ? OR director LIKE ? OR producer LIKE ?", "%#{list_params[:keyword]}%", "%#{list_params[:keyword]}%", "%#{list_params[:keyword]}%", "%#{list_params[:keyword]}%")
  end

  private

  def list_params
    params.permit(:keyword)
  end
end
