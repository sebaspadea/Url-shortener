class LinksController < ApplicationController
  def index
    @links = Link.all
    respond_to do |format|
      format.html
      format.json { render json: { links: @links } }
    end
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.short_url = @link.generate_short_url
    if @link.save
      redirect_to root_path
    else
      flash[:danger] = "No se pudo crear la url!"
      redirect_to root_path
    end
  end

  def destroy
    #Encuentro el link a eliminar
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to root_path
  end

  def show
    @link = Link.find_by(short_url: params[:short_url])
    @link.clicked += 1
    @link.save
    redirect_to @link.url
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
