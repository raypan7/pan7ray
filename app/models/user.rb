# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :nullify

  # enum ......................................................................
  enum role: {
    admin: 0,
  }

  def admin?
    role == 'admin'
  end

  def display_name
    nickname.presence || email.split('@').first
  end
end
