class ShortLinksController < ApplicationController
  before_action :set_short_link, only: [ :update]
  respond_to :html,:json,:js
  after_action :increse_hit_count, :fetch


  def index
    @short_links = ShortLink.all.limit(100)
    @short_link = ShortLink.new
  end

  def fetch
    slug = params[:slug]
    @short_link = ShortLink.find_by_slug(slug)
    if @short_link.present?
      path = @short_link.main_url
    end
    redirect_to path
    return
  end

  def new
    @short_link = ShortLink.new
  end


  def create
    @short_link = ShortLink.new(short_link_params)
    if @short_link.new_url?
      @short_link.save
    else
      @short_link = @short_link.find_existing
    end
    respond_with @short_link.find_existing
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


    def increase_hit_count
      @short_link.hit_count += 1
      short_link.save
    end
end
