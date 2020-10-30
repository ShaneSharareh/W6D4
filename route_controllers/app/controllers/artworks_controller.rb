class ArtworksController < ApplicationController

    def index
        artworks = Artwork.all
        render json: artworks
    end

    def show 
        artwork = Artwork.find_by(id: params[:id])
        render json: artwork
    end

    def create
      artwork = Artwork.new(artwork_params)

      if artwork.save
            render json: artwork# redirect_to artwork_url(artwork)
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        artwork = Artwork.find_by(id: params[:id])

        if artwork.update(artwork_params)
            render json: artwork#redirect_to artwork_url(artwork)
        else
            render json: artwork.erros.full_messages, status: 422
        end
    end

    def destroy
        artwork = Artwork.find_by(id: params[:id])
        artwork.destroy
        # redirect_to artwork_url(artwork)
        render json: Artwork.all
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end

end