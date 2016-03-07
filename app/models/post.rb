require 'random_data'

class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy

  default_scope { order('created_at DESC')}
  scope :ordered_by_title, -> {order('title DESC')}
  scope :ordered_by_reverse_created_at, -> {order('created_at ASC')}
#first set the default_scope, describe what it will do
#then list all the available scopes that this project will have by scope title, then describe how it will be ordered!

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20}, presence: true
  validates :topic, presence: true
  validates :user, presence: true
end
