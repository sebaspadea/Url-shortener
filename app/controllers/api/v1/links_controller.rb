class Api::V1::LinksController < Api::V1::BaseController
  before_action :set_link, only: [ :show ]

  def index
    @links = policy_scope(Link)
  end

  def show
  end

  private

  def set_link
    @link = Link.find(params[:id])
    authorize @link
  end
end