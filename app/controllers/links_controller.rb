class LinksController < ApplicationController
  before_action :set_link, only: %i[ show ]

  # GET /links or /links.json
  def index
    @links  = Link.all
    @link   = Link.new
  end

  # GET /links/1 or /links/1.json
  def show
    render 'errors/404', status: 404 if @link.nil?
    @link.update_attribute(:clicked, @link.clicked.to_i + 1)
    redirect_to @link.url, allow_other_host: true
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # POST /links or /links.json
  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to links_url, notice: "Link was successfully created." }
        format.json { render :index, status: :created }
      else
        format.html { redirect_to links_url, notice: @link.errors.full_messages}
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find_by_slug(params[:slug])
    end

    # Only allow a list of trusted parameters through.
    def link_params
      params.require(:link).permit(:url, :slug, :clicked)
    end
end
