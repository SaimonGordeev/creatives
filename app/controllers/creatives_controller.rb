class CreativesController < ApplicationController
  before_action :set_creative, only: [:show, :edit, :update, :destroy, :sort]
  before_action :set_chapters, only: [:show, :edit]
  before_filter :authenticate_user!, only: [:index, :new, :edit, :create, :update, :destroy, :sort]
  before_action :check_user, only: [:edit, :update, :destroy, :sort]

  # GET /creatives
  # GET /creatives.json
  def index
    @creatives = current_user.admin? ? Creative.all : current_user.creatives
  end

  # GET /creatives/1
  # GET /creatives/1.json
  def show
    @comments = @creative.comments
    @new_comment = Comment.new(params[:creative_id])
  end

  # GET /creatives/new
  def new
    @creative = Creative.new
  end

  # GET /creatives/1/edit
  def edit

  end

  # POST /creatives
  # POST /creatives.json
  def create
    @creative = Creative.new(creative_params)
    @creative.user = current_user
    respond_to do |format|
      if @creative.save
        format.html { redirect_to @creative, notice: 'Creative was successfully created.' }
        format.json { render action: 'show', status: :created, location: @creative }
      else
        format.html { render action: 'new' }
        format.json { render json: @creative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creatives/1
  # PATCH/PUT /creatives/1.json
  def update
    respond_to do |format|
      if @creative.update(creative_params)
        format.html { redirect_to @creative, notice: 'Creative was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @creative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creatives/1
  # DELETE /creatives/1.json
  def destroy
    @creative.destroy
    respond_to do |format|
      format.html { redirect_to creatives_url }
      format.json { head :no_content }
    end
  end

  def sort
    @chapters = @creative.chapters
    @chapters.each do |chapter|
      chapter.position = params['chapter'].index(chapter.id.to_s) + 1
      chapter.save
    end
    render :nothing => true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creative
      @creative = Creative.find(params[:id])
    end

    def set_chapters
      @chapters = @creative.chapters
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creative_params
      params.require(:creative).permit(:title, :description, :created_at, :tag_list)
    end

    def check_user
      redirect_to root unless @creative.user == current_user || current_user.admin?
    end
end
