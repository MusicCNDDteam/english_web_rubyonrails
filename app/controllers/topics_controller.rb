class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user,
                only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @words = @topic.words
    @quizzes = @topic.quizzes
    
    # Build for create new word form.
    @word = Word.new
    @word[:topic_id] = @topic.id
  end

  # GET /topics/new
  def new
    # Get course_id from Url and pass to object model.
    @topic = Topic.new(:course_id => params[:course])
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic.course, notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def correct_user
      @topic = Topic.find(params[:id])
      redirect_to(root_url) unless (@topic.course.author_id == current_user.id)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:name, :description, :course_id)
    end
end
