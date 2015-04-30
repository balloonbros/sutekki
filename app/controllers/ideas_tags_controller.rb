class IdeasTagsController < ApplicationController
  before_action :set_ideas_tag, only: [:show, :edit, :update, :destroy]

  # GET /ideas_tags
  # GET /ideas_tags.json
  def index
    @ideas_tags = IdeasTag.all
  end

  # GET /ideas_tags/1
  # GET /ideas_tags/1.json
  def show
  end

  # GET /ideas_tags/new
  def new
    @ideas_tag = IdeasTag.new
  end

  # GET /ideas_tags/1/edit
  def edit
  end

  # POST /ideas_tags
  # POST /ideas_tags.json
  def create
    @ideas_tag = IdeasTag.new(ideas_tag_params)

    respond_to do |format|
      if @ideas_tag.save
        format.html { redirect_to @ideas_tag, notice: 'Ideas tag was successfully created.' }
        format.json { render :show, status: :created, location: @ideas_tag }
      else
        format.html { render :new }
        format.json { render json: @ideas_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas_tags/1
  # PATCH/PUT /ideas_tags/1.json
  def update
    respond_to do |format|
      if @ideas_tag.update(ideas_tag_params)
        format.html { redirect_to @ideas_tag, notice: 'Ideas tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @ideas_tag }
      else
        format.html { render :edit }
        format.json { render json: @ideas_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas_tags/1
  # DELETE /ideas_tags/1.json
  def destroy
    @ideas_tag.destroy
    respond_to do |format|
      format.html { redirect_to ideas_tags_url, notice: 'Ideas tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ideas_tag
      @ideas_tag = IdeasTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ideas_tag_params
      params.require(:ideas_tag).permit(:idea_id, :tag_id)
    end
end
