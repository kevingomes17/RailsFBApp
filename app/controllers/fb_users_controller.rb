class FbUsersController < ApplicationController
  # GET /fb_users
  # GET /fb_users.json
  def index
    @fb_users = FbUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fb_users }
    end
  end

  # GET /fb_users/1
  # GET /fb_users/1.json
  def show
    @fb_user = FbUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fb_user }
    end
  end

  # GET /fb_users/new
  # GET /fb_users/new.json
  def new
    @fb_user = FbUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fb_user }
    end
  end

  # GET /fb_users/1/edit
  def edit
    @fb_user = FbUser.find(params[:id])
  end

  # POST /fb_users
  # POST /fb_users.json
  def create
    @fb_user = FbUser.new(params[:fb_user])

    respond_to do |format|
      if @fb_user.save
        format.html { redirect_to @fb_user, notice: 'Fb user was successfully created.' }
        format.json { render json: @fb_user, status: :created, location: @fb_user }
      else
        format.html { render action: "new" }
        format.json { render json: @fb_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fb_users/1
  # PUT /fb_users/1.json
  def update
    @fb_user = FbUser.find(params[:id])

    respond_to do |format|
      if @fb_user.update_attributes(params[:fb_user])
        format.html { redirect_to @fb_user, notice: 'Fb user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fb_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fb_users/1
  # DELETE /fb_users/1.json
  def destroy
    @fb_user = FbUser.find(params[:id])
    @fb_user.destroy

    respond_to do |format|
      format.html { redirect_to fb_users_url }
      format.json { head :no_content }
    end
  end
end
