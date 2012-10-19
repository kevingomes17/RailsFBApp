class FbConnectionsController < ApplicationController
  # GET /fb_connections
  # GET /fb_connections.json
  def index
    @fb_connections = FbConnection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fb_connections }
    end
  end

  # GET /fb_connections/1
  # GET /fb_connections/1.json
  def show
    @fb_connection = FbConnection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fb_connection }
    end
  end

  # GET /fb_connections/new
  # GET /fb_connections/new.json
  def new
    @fb_connection = FbConnection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fb_connection }
    end
  end

  # GET /fb_connections/1/edit
  def edit
    @fb_connection = FbConnection.find(params[:id])
  end

  # POST /fb_connections
  # POST /fb_connections.json
  def create
    @fb_connection = FbConnection.new(params[:fb_connection])

    respond_to do |format|
      if @fb_connection.save
        format.html { redirect_to @fb_connection, notice: 'Fb connection was successfully created.' }
        format.json { render json: @fb_connection, status: :created, location: @fb_connection }
      else
        format.html { render action: "new" }
        format.json { render json: @fb_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fb_connections/1
  # PUT /fb_connections/1.json
  def update
    @fb_connection = FbConnection.find(params[:id])

    respond_to do |format|
      if @fb_connection.update_attributes(params[:fb_connection])
        format.html { redirect_to @fb_connection, notice: 'Fb connection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fb_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fb_connections/1
  # DELETE /fb_connections/1.json
  def destroy
    @fb_connection = FbConnection.find(params[:id])
    @fb_connection.destroy

    respond_to do |format|
      format.html { redirect_to fb_connections_url }
      format.json { head :no_content }
    end
  end
end
