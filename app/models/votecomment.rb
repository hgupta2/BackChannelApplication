class Votecomment < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :comment_id, :user_id

  belongs_to :comment
  belongs_to :user

  def updatetime(commentid)
    @comment = Comment.find(commentid)
    postid = @comment.post_id
    @post = Post.find(postid)
    @post.update_attributes(:updated_at => Time.now)
  end

end