class RecommentsController < ApplicationController
    def create
        @recomment = Recomment.new
        @recomment.content = params[:input_recomment]
        @recomment.comment_id = params[:comment_id]
        @recomment.save
        redirect_to "/home/show/#{params[:post_id]}"
    end
    
    def destroy
        @recomment = Recomment.find(params[:recomment_id])
        @recomment.destroy
        redirect_to "/home/show/#{params[:post_id]}"
    end
end
