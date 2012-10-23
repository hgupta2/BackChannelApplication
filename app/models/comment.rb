class Comment < ActiveRecord::Base
  attr_accessible :description
  attr_accessible :post_id
  attr_accessible :user_id


  belongs_to :post, :touch => true
  belongs_to :user
  has_many :votecomment, :dependent => :destroy

  validates :description, :presence => true
  #validates :post_id, :presence => true
  #validates :user_id, :presence => true
end
