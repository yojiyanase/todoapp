class Task < ApplicationRecord
    has_one_attached :eyecatch

    belongs_to :user
    belongs_to :board, optional: true

    def display_created_at
        I18n.l(created_at, format: :default)
    end

    def author_name
        user.display_name
    end
end
