class LinksController < ApplicationController
  def index
    @links = Link.all
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.short_url = @link.generate_short_url
    if @link.save
      redirect_to root_path
    else
      flash[:warning] = "No se pudo crear la url!"
      redirect_to root_path
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to root_path
  end

  def show
    @link = Link.find_by(short_url: params[:short_url])
    @link.clicked += 1
    redirect_to @link.url
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
