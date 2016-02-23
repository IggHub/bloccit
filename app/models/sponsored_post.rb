require 'random_data'

class SponsoredPost < ActiveRecord::Base
  belongs_to :topic
end
