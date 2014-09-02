class User < ActiveRecord::Base
	
	has_secure_password

	has_many :questions
	has_many :answers

	validates :username, presence: true, uniqueness: { case_sensitive: true},
							length: {in: 2..12 }

	validates :password, length: { in: 2..12 }
	validates :password_confirmation, length: { in: 2..12 }

	
	def your_questions(params)
		questions.order('created_at DESC').paginate(page: params[:page], per_page: 3)
	end
end
