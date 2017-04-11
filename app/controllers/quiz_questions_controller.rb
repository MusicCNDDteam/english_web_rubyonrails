class QuizQuestionsController < ApplicationController
  before_action :set_quiz_question, only: [:show, :edit, :update, :destroy]

  # GET /quiz_questions
  # GET /quiz_questions.json
  def index
    @quiz_questions = QuizQuestion.all
  end

  # GET /quiz_questions/1
  # GET /quiz_questions/1.json
  def show
    @quiz_answers =  @quiz_question.quiz_answers

    # Create new question answer instance.
    @quiz_answer = QuizAnswer.new
    @quiz_answer.quiz_question_id = @quiz_question.id
  end

  # GET /quiz_questions/new
  def new
    @quiz_question = QuizQuestion.new(:quiz_question_id => params[:quiz_question].id)
  end

  # GET /quiz_questions/1/edit
  def edit
  end

  # POST /quiz_questions
  # POST /quiz_questions.json
  def create
    @quiz_question = QuizQuestion.new(quiz_question_params)

    respond_to do |format|
      if @quiz_question.save
        format.html { redirect_to @quiz_question, notice: 'Quiz question was successfully created.' }
        format.json { render :show, status: :created, location: @quiz_question }
      else
        format.html { render :new }
        format.json { render json: @quiz_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quiz_questions/1
  # PATCH/PUT /quiz_questions/1.json
  def update
    respond_to do |format|
      if @quiz_question.update(quiz_question_params)
        format.html { redirect_to @quiz_question, notice: 'Quiz question was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz_question }
      else
        format.html { render :edit }
        format.json { render json: @quiz_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_questions/1
  # DELETE /quiz_questions/1.json
  def destroy
    @quiz_question.destroy
    respond_to do |format|
      format.html { redirect_to quiz_questions_url, notice: 'Quiz question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_question
      @quiz_question = QuizQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_question_params
      params.require(:quiz_question).permit(:name, :description, :question_type, :quiz_id)
    end
end
