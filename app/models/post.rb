# frozen_string_literal: true

class Post < ApplicationRecord
  validates_presence_of :name
  has_many :comments, dependent: :nullify
end
