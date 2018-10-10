class AlbumsController < ApplicationController

  # Calling method require_user in application_controller.rb
  # before running the index or show actions
  before_action :require_user, only: [:index, :show]

  def index
    @albums = Album.all
  end 

  def show
    @album = Album.find(params[:id])
    @photos = @album.photos
  end

end

