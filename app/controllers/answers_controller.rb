class AnswersController < ApplicationController

	before_filter :auth, only: [:create]

	def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.build(answers_params)
		@answer.user = current_user

		if @answer.save
			flash[:success] = 'Answer has been posted'
			redirect_to @question
		else
			@question = Question.find(params[:question_id])
			render 'questions/show'
		end
	end

	private

		def answers_params
			params.require(:answer).permit(:user_id, :question_id, :body)
		end
end
