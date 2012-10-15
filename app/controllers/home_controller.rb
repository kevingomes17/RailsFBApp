require 'koala'

class HomeController < ApplicationController
  protect_from_forgery

  def index
      #graph = Koala::Facebook::GraphAPI.new(@facebook_cookies["access_token"])
      #@likes = graph.get_connections("me", "likes")

      session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/home/callback')
      		      @auth_url =  session[:oauth].url_for_oauth_code(:permissions=>"read_stream,read_friendlists,user_location,email")
		      puts session.to_s + "<<< session"

      respond_to do |format|
                  format.html {  }
      end
  end


 
  def callback
        if params[:code]
                # acknowledge code and get access token from FB
                  session[:access_token] = session[:oauth].get_access_token(params[:code])
                end

                 # auth established, now do a graph call:

		   @api = Koala::Facebook::API.new(session[:access_token])
		   	begin
			    @me = @api.get_object("/me")
                     	@graph_data = @api.get_object("/me/friends")
				    rescue Exception=>ex
						puts ex.message
						     end


    cur_user = FbUser.find_or_initialize_by_fbid(@me["id"])
    cur_user.email = @me["email"]
    cur_user.name = @me["name"]
    cur_user.save!

    @graph_data.each do |friend|
    	c = FbUser.find_or_initialize_by_fbid(:name=>friend["name"], :fbid => friend["id"])
    	c.save!
    end						     
                respond_to do |format|
                 format.html {   }
		 	     end
			     end
end
