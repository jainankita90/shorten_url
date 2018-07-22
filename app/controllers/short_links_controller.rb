class ShortLinksController < ApplicationController
  before_action :set_short_link, only: [ :update]


  def index

    @short_links = ShortLink.all.limit(100)
    @short_link = ShortLink.new
  end


  def new
    @short_link = ShortLink.new
  end


  def create
    @short_link = ShortLink.new(short_link_params)
    respond_to do |format|
      if @short_link.save
        format.html { redirect_to short_links_url }
        format.js #{ render short_links_url, turbolinks: false}

        format.json { render short_links_url, status: :created, location: @short_link }
      else
        format.html { render :new }
        format.json {
          render json: @short_link.errors,
          status: :unprocessable_entity
        }
      end
    end
  end


  def update
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_link
      @short_link = ShortLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_link_params
      params.require(:short_link).permit(:main_url)
    end
end
