class Api::V1::LinksController < Api::V1::BaseController
  before_action :set_link, only: [ :show, :destroy ]

  def index
    @links = policy_scope(Link)
  end

  def show
  end

  def create
    @link = Link.new(link_params)
    @link.short_url = @link.generate_short_url
    authorize @link
    if @link.save
      render :show, status: :created
    else
      render_error
    end

    #Forma de uso
    #curl -i -X POST                                                              \
    #-H 'Content-Type: application/json'                                     \
    #-d '{ "restaurant": { "name": "New restaurant", "address": "Paris" } }' \
    #http://localhost:3000/api/v1/restaurants
    
  end

  def destroy
    @link.destroy
    head :no_content

    #Forma de uso
    #curl -i -X DELETE                               \
    #http://localhost:3000/api/v1/restaurants/1
  end

  private

  def set_link
    @link = Link.find(params[:id])
    authorize @link
  end
end