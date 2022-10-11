class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :groups, foreign_key: 'author_id'
  has_many :operations, foreign_key: 'author_id'

  validates :name, presence: true, length: { minimum: 5 }
  validates :email, presence: true, length: { minimum: 5 }
  validates :password, presence: true, length: { minimum: 6 }

  def groups
    Group.where(user_id: id).all
  end

  def operations
    Operation.where(user_id: id).all
  end
end
