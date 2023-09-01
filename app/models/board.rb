class Board < ApplicationRecord

  validates :title, presence: true
  validates :title, length: { minimum: 2, maximum: 100 }
  validates :title, format: { with: /\A(?!@)/ }

  validates :content, presence: true
  validates :content, length: { minimum: 10 }
  validates :content, uniqueness: true

    belongs_to :user
    has_many :tasks, dependent: :destroy

    def display_created_at
        I18n.l(created_at, format: :default)
    end
    
    def author_name
        user.display_name
    end

end
