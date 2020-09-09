class LinksController < ApplicationController
  def index
    @links = Link.all
    @link = Link.new
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.short_url = @link.generate_short_url
    flash[:error] = @link.errors.full_messages unless @link.save
    redirect_to root_path
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
