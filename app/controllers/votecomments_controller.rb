class VotecommentsController < ApplicationController
  # GET /votecomments
  # GET /votecomments.json
  def index
    @votecomments = Votecomment.find_all_by_comment_id(params[:comment_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # POST /votecomments
  # POST /votecomments.json
  def create
    @votecomment = Votecomment.new(params[:votecomment])
    @votecomment.user_id = session[:user_id]
    if @votecomment.save
       @votecomment.updatetime(@votecomment.comment_id)
       redirect_to(posts_path)
    else
      flash[:notice] = "Error in creating vote: #{@votecomment.errors}"
      redirect_to(posts_path)
    end
  end

  # DELETE /votecomments/1
  # DELETE /votecomments/1.json
  def destroy
    @votecomment = Votecomment.find(params[:id])
    @votecomment.destroy
    redirect_to(posts_path)
  end
end
