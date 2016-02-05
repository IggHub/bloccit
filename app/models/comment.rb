#require 'random_data'
class Comment < ActiveRecord::Base
  belongs_to :post
end
