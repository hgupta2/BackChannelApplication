class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all(:order => 'updated_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @vote = Vote.new( :post_id => @post.id )
    @comment = Comment.new(:post_id => @post.id)
    #@votecomment = Votecomment.new( :comment_id => @comment.id )
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.user_id = session[:user_id]

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    if(ispostowner(session[:user_id],@post) || adminornot)
      respond_to do |format|
        if @post.update_attributes(params[:post])
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
    end
    else
      flash[:notice] = "Error only creator can update his post: #{@post.errors}"
      redirect_to(posts_path)

      end
    end


  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    if(ispostowner(session[:user_id],@post) || adminornot)
    @post.destroy

    respond_to do |format|
      flash[:notice] = "Post was successfully deleted"
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
    else
      flash[:notice] = "Error only creator can delete his post: #{@post.errors}"
      redirect_to(posts_path)
      end
  end

  # report /posts/report
  # DELETE /posts/report.json
  def report
    @users = User.all

    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def reportpost
    @posts = Post.all

    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

end
