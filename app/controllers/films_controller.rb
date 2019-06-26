class FilmsController < ApplicationController
  def show
    @film = api_request 'films', id: params[:id]
    @characters = get_list(@film["characters"], 'people')
  end
end
