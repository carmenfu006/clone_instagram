class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    if current_user
      @photo = Photo.new
    else
      redirect_to root_path, alert: 'You must be logged in'
    end
  end

  def create
    @photo = current_user.photos.create(params_photo)
      if @photo.save
      redirect_to @photo
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      redirect_to user_path(@photo.user)
    end
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render :photo_path
    end
  end

private
  def params_photo
    params.require(:photo).permit(:caption, :file)
  end
end
