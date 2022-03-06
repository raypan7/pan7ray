# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  default_scope -> { order('comments.updated_at DESC') }

  def can_deleted_by(user)
    user && (user.admin? || user == author)
  end
end
