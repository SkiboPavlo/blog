class CompressedUrlsController < ApplicationController
  def index
    @urls = CompressedUrl.all
  end

  def new
    @url = CompressedUrl.new
  end

  def edit
    @url = CompressedUrl.find params[:id]
  end

  def create
    @url = CompressedUrl.new(compressed_url_params)
    @url.compress!
    if @url.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @url = CompressedUrl.find params[:id]

    if @url.update_attributes!(compressed_url_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @url = CompressedUrl.find params[:id]
    @url.destroy
    redirect_to root_path
  end

  private

  def compressed_url_params
    params.require(:compressed_url).permit(:name, :origin_url)
  end
end
