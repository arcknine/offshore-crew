class FilmsController < ApplicationController
  def show
    @film = api_request 'films', id: params[:id]
    # render :json => @film
  end
end
