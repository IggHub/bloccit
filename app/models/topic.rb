require 'random_data'

class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

#  validates :posts, presence: true
  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 15}, presence: true

end
