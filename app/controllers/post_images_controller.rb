class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end
  
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
     @post_images = PostImage.page(params[:page])
  end

  def show
  end
  
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
