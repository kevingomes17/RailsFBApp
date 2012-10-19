require 'koala'

class HomeController < ApplicationController
  protect_from_forgery

  def index
    #graph = Koala::Facebook::GraphAPI.new(@facebook_cookies["access_token"])
    #@likes = graph.get_connections("me", "likes")

    session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/home/pullfriends')
    @auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"read_stream,read_friendlists,user_location,email")
    puts session.to_s + "<<< session"

    respond_to do |format|
      format.html {  }
    end
  end
 
  #User is logged in.
  #Fetch his email id.
  #Fetch fbids of his friends.
  def pullfriends 
    if params[:code]
      # acknowledge code and get access token from FB
      session[:access_token] = session[:oauth].get_access_token(params[:code])
    end

    # auth established, now do a graph call:
    @api = Koala::Facebook::API.new(session[:access_token])
    begin
      @me = @api.get_object("/me")
      
      cur_user = FbUser.find_or_initialize_by_fbid(@me["id"])
      cur_user.email = @me["email"]
      cur_user.name = @me["name"]
      cur_user.save!
      
      @count = 0
      @graph_data = @api.get_object("/me/friends")
      
      @graph_data.each do |friend|
        c = FbConnection.find_or_initialize_by_user_fbid_and_friend_fbid(:user_fbid=>@me["id"], :friend_fbid => friend["id"])
        c.save!
        @count = @count + 1
      end
      
      rescue Exception=>ex
        puts ex.message
    end
    
    respond_to do |format|
      format.html { }
    end
  end
  
  #Pull fbids of the users whose email addresses are in DB.
  def pullfbids
		if params[:code]
      # acknowledge code and get access token from FB
      session[:access_token] = session[:oauth].get_access_token(params[:code])
    end

    # auth established, now do a graph call:

    @api = Koala::Facebook::API.new(session[:access_token])
    begin
      #@user = @api.search("FBFriend@LiveWat.ch", {:type=>"user"})
      #@user = @api.search("koala")
      
      @users = FbUser.all
      #@users = (current_user.blank? ? User.all : User.find(:all, :conditions => ["id != ?", current_user.id]))
      @users.each do |user|
        @fbUserObj = @api.search(user["email"], {:type=>"user"})
        user.fbid = @fbUserObj[0]["id"] if (@fbUserObj != nil)
        user.save!
      end
      
      rescue Exception=>ex
        puts ex.message
    end
    
    respond_to do |format|
      format.html {   }
    end
  end
end
