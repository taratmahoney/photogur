class PicturesController < ApplicationController
  def index #the methods inside controllers are always called actions
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture= Picture.new(picture_params)
    if @picture.save
      redirect_to pictures_url
    else
    render :new
    #render :text => "Saving a picture. URL: #{params[:url]}, Title: #{params[:title]}, Artist: #{params[:artist]}"
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update_attributes(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end


  private #this is private because it will poorly interpreted as an action 
  def picture_params
    params.require(:picture).permit(:artist, :title, :url)
    
  end
end
