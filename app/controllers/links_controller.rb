class LinksController < ApplicationController
  layout "navbar"
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  def index
    @links = current_user.links
  end

  def show
  end

  def new
    @link = current_user.links.build
  end

  def create
    @link = current_user.bio.links.build(link_params)

    if @link.save
      redirect_to links_path, notice: "Link was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @link.update(link_params)
      redirect_to links_path, notice: "Link was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @link.destroy

    respond_to do |format|
      format.html { redirect_to links_path, notice: "Link was successfully destroyed." }
      format.turbo_stream
    end
  end

  private
    def set_link
      @link = current_user.links.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:name, :url)
    end
end
