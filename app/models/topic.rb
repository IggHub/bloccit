require 'random_data'

class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
end
