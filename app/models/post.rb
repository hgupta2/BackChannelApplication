class Post < ActiveRecord::Base
  attr_accessible :description, :title, :total_votes, :updated_at
  attr_accessible :category_id, :user_id

  belongs_to :category
  has_many :comments, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  belongs_to :user

  validates :description, :presence => true
  validates :title, :presence => true
  #validates :category_id, :presence => true
  #validates :user_id, :presence => true

def get_totalvote(postid)
  return Vote.count_by_sql"SELECT COUNT(*) FROM Votes Where Votes.post_id = #{postid}"
end
def get_vote_count(userid, postid)
  @vote = Vote.find_by_user_id_and_post_id(userid, postid)
  if(@vote)
    if (@vote.user_id == userid)
      return "You and #{get_totalvote(postid) - 1} other people voted"
    else
      return "#{get_totalvote(postid)} people voted"
    end
  else
    return "#{get_totalvote(postid)} people voted"
  end
end

  def get_totalvote_comment(commentid)
    return Vote.count_by_sql"SELECT COUNT(*) FROM Votecomments Where VoteComments.comment_id = #{commentid}"
  end
  def get_votecomment_count(userid, commentid)
    @votecomment = Votecomment.find_by_user_id_and_comment_id(userid, commentid)
    if(@votecomment)
      if (@votecomment.user_id == userid)
        return "You and #{get_totalvote_comment(commentid) - 1} other people voted"
      else
        return "#{get_totalvote_comment(commentid)} people voted"
      end
    else
      return "#{get_totalvote_comment(commentid)} users like it"
    end
  end



def votecheck?(userid, postid)
    @vote = Vote.find_by_user_id_and_post_id(userid, postid)
    @post = Post.find_by_id(postid)
    if(@vote || userid == @post.user_id)
      return false
    else
      return true
    end

end

def votecommentcheck?(userid, commentid)
    @votecomment = Votecomment.find_by_user_id_and_comment_id(userid, commentid)
    @comment = Comment.find_by_id(commentid)
    if(@votecomment || userid == @comment.user_id)
      return false
    else
      return true
    end

end


end


