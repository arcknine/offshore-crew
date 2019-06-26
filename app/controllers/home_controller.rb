class HomeController < ApplicationController
  before_action :list_params,

  def index
    @list = api_request 'films'
  end

  def search
    @list = api_request 'films', keyword: list_params[:keyword]
  end

  private

  def list_params
    params.permit(:keyword)
  end
end
