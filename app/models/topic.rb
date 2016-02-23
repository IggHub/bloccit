require 'random_data'

class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :sponsored_post
end
