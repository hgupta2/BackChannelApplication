class UsersController < ApplicationController
  before_filter :save_login_state, :only => [:new, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    #Signup Form
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])

  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "You Signed up successfully!! Please log in using your credentials!!"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    redirect_to(root_path)
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def search
      @type = params[:in]

      if (@type == "User Name")

      allusers = User.all
      @posts = Array.new

      allusers.each do |eachuser|

        search_term = params[:q].to_s


        search_term_lower_case = search_term.downcase

        eachuser_username_lower_case = eachuser.username.downcase

        if(eachuser_username_lower_case.include?(search_term_lower_case))



          @eachposts = Post.find_all_by_user_id(eachuser.id)

          puts @eachposts

          @eachposts.each do |eachpost|
            @posts << eachpost
          end
        end

      end
      respond_to do |format|
        format.html
        format.json { head :no_content }
      end

      elsif (@type == "categories")

        allcategories = Category.all
        @posts = Array.new

        allcategories.each do |eachcategory|

          search_term = params[:q].to_s


          search_term_lower_case = search_term.downcase

          eachcategory_name_lower_case = eachcategory.name.downcase

          if(eachcategory_name_lower_case.include?(search_term_lower_case))

            @eachposts = Post.find_all_by_category_id(eachcategory.id)

            puts @eachposts

            @eachposts.each do |eachpost|
              @posts << eachpost


            end

          end
        end


        respond_to do |format|
          format.html
          format.json { head :no_content }
        end

      elsif (@type == "Content")
        @posts = Array.new

        allposts = Post.all

        for eachpost in allposts do

          search_term = params[:q].to_s


          search_term_lower_case = search_term.downcase

          eachpost_description_lower_case = eachpost.title.downcase

           if(eachpost_description_lower_case.include?(search_term_lower_case))

            @posts << eachpost

            end

        end
        respond_to do |format|
          format.html
          format.json { head :no_content }
        end
      else

        flash[:notice] = "You need to select both fields to search"
        redirect_to(root_path)

      end
    end
  end

