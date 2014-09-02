class QuestionsController < ApplicationController
  
  before_filter :auth, only: [:create, :your_questions, :edit, :update]

  def index
  	@question = Question.new
    @questions = Question.unsolved(params)
    @p = params
  end

  def create
  	@question = current_user.questions.build(questions_params)

  	if @question.save
  		flash[:success] = 'Question has been posted.'
  		redirect_to @question
  	else
  		flash.now[:error] = 'Something went wrong.'
      @questions = Question.unsolved(params)
  		render 'index'
  	end
  end

  def show
    @question = Question.find_by(id: params[:id])
    @answer = Answer.new
  end

  def edit
    @question = current_user.questions.find_by(id: params[:id])
  end

  def update
    @params = params
    @question = current_user.questions.find_by(id: params[:id])

    if @question.update_attributes(questions_params)
      flash[:success] = 'Question has been updated'
      redirect_to @question
    else
      render 'edit'
    end
  end

  def your_questions
    @questions = current_user.your_questions(params)
  end

  def search
    @questions = Question.search(params)
  end

  private
  	def questions_params
  		params.require(:question).permit(:body, :solved)
  	end
end
