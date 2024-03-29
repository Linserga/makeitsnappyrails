class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :body, presence: true, length: {in: 2..255}
  validates :solved, inclusion: {in: [true, false]}

  def self.unsolved(params)
  	where(solved: false).order('created_at DESC').paginate(page: params[:page], per_page: 3)
  end

  def self.search(params)
  	where('body like ?', "%#{params[:keyword]}%").order('created_at DESC').paginate(page: params[:page], per_page: 3)
  end
end
