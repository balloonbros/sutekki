class IdeasController < ApplicationController
  before_action :logged_in_user
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :set_labels

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.where(search_params).order(id: :desc)
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)
    @idea.user_id = current_user.id
    @idea.published = true

    respond_to do |format|
      if @idea.save
        if ENV['SLACK_WEBHOOK_URL'].present?
          slack = Slack::Incoming::Webhooks.new ENV['SLACK_WEBHOOK_URL']
          attachments = [{
            title: @idea.title,
            title_link: ENV['SITE_URL'],
            text: @idea.body,
            color: "#7CD197"
          }]
          slack.post "New Post!", attachments: attachments
        end

        label_params.each do |label|
          IdeasLabel.find_or_create_by(idea_id: @idea.id, label_id: label[1]) if label[1].to_i > 0
        end

        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    @idea.labels.destroy_all
    label_params.each do |label|
      IdeasLabel.find_or_create_by(idea_id: @idea.id, label_id: label[1]) if label[1].to_i > 0
    end
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.disable
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    def search_params
      query = params.permit(:published, :status)
      query[:published] = \
        ActiveRecord::Type::Boolean.new.type_cast_from_user(request.query_parameters[:published]) unless query[:published].nil?
      query
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:title, :body, :published, :status)
    end

    def label_params
      params[:ideas_label] ||= []
    end

    def set_labels
      @labels = Label.all
    end
end
