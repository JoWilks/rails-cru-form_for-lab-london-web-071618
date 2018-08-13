class ArtistsController < ApplicationController

def index
  @artists =  Artist.all
end

def show
  @artist = Artist.find(params[:id])
end

def new
  @artist = Artist.new
end

def edit
  @artist = Artist.find(params[:id])
end

def create
  @artist = Artist.create(post_params(:name, :bio))
  redirect_to @artist
end

def update
  @artist = Artist.find(params[:id])
  @artist.update(post_params(:name, :bio))
  redirect_to @artist
end

private

def post_params(*args)
   params.require(:artist).permit(*args)
end

end