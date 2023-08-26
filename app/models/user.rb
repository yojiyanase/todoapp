class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :boards, dependent: :destroy

  def has_written?(board)
    boards.exists?(id: board.id)
  end

  def display_name
    # profile&.nickname || self.email.split('@').first
  end

end
