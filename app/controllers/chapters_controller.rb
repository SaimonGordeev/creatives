class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_action :set_creative
  before_action :check_user, only:  [:edit, :create, :update, :destroy]

  # GET /chapters
  def index
    redirect_to creatives_url
  end

  # GET /chapters/1
  def show
  end

  # GET /chapters/new
  def new
    @chapter = Chapter.new
    @url = :creative_chapters
  end

  # GET /chapters/1/edit
  def edit
    @url = :creative_chapter
  end

  # POST /chapters
  def create
    @chapter = Chapter.new(chapter_params)
    @chapter.creative_id = params[:creative_id]
    if @chapter.save
      redirect_to @creative, notice: 'Chapter was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /chapters/1
  def update
    if @chapter.update(chapter_params)
      redirect_to @creative, notice: 'Chapter was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /chapters/1
  def destroy
    @chapter.destroy
    redirect_to @creative
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    def set_creative
      @creative = Creative.find(params[:creative_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:body, :title)
    end

    def check_user
      redirect_to root unless @chapter.creative.user == current_user || current_user.admin?
    end
end
