class RelationshipsController < ApplicationController
    
def create
  follow = current_user.active_relationships.build(follower_id: params[:user_id])
  follow.save
  redirect_to request.referer
end

def destroy
  follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
  follow.destroy
  redirect_to request.referer
end




# def create
#   current_user.follow(params[:user_id])
#   redirect_to request.referer
# end

# def destroy
#   current_user.unfollow(params[:user_id])
#   redirect_to request.referer  
# end


# def followings
#   user = User.find(params[:id])
#   @users = user.followings
# end

# def followers
#   user = User.find(params[:id])
#   @users = user.follower
# end

  
end
