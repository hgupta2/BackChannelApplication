class Vote < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :post_id, :user_id
  belongs_to :post, :touch => true
  belongs_to :user
end
