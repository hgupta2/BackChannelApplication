class VotesController < ApplicationController
  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.find_all_by_post_id(params[:post_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(params[:vote])
    @vote.user_id = session[:user_id]
    if @vote.save
      redirect_to(posts_path)
    else
      flash[:notice] = "Error in creating vote: #{@vote.errors}"
      redirect_to(posts_path)
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    redirect_to(posts_path)
  end


end
